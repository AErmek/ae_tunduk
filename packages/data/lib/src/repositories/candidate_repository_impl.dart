import 'dart:async';

import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:cv_scan_data/src/local/dao/candidates_dao.dart';
import 'package:cv_scan_data/src/local/dao/outbox_dao.dart';
import 'package:cv_scan_data/src/local/database/app_database.dart';
import 'package:cv_scan_data/src/local/mappers/candidate_local_mapper.dart';
import 'package:cv_scan_data/src/remote/generated/api/api_client.dart';
import 'package:cv_scan_data/src/remote/mappers/candidate_mapper.dart';
import 'package:cv_scan_data/src/sync/sync_engine.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:drift/drift.dart';

class CandidateRepositoryImpl implements CandidateRepository {
  CandidateRepositoryImpl({
    required this.apiClient,
    required this.candidatesDao,
    required this.outboxDao,
    required this.syncEngine,
  });

  final ApiClient apiClient;
  final CandidatesDao candidatesDao;
  final OutboxDao outboxDao;
  final SyncEngine syncEngine;

  @override
  Stream<List<Candidate>> watchCandidates({
    required int page,
    required int size,
    CandidateVerdict? verdict,
    String? query,
    SortField sort = SortField.dateAdded,
  }) {
    final overlaid = combineLatest2(candidatesDao.watchAll(), outboxDao.watchPending(), _applyOverlay);
    return overlaid.asyncMap(mapRowsAsync);
  }

  @override
  Stream<Candidate?> watchCandidate(String id) {
    return combineLatest2(candidatesDao.watchById(id), outboxDao.watchPending(), (row, pending) {
      if (row == null) return null;
      return _applyOverlay([row], pending).first;
    }).map((row) => row?.toDomain());
  }

  @override
  Future<Page<Candidate>> fetchCandidates({
    required int page,
    required int size,
    CandidateVerdict? verdict,
    String? query,
    SortField sort = SortField.dateAdded,
  }) async {
    final response = await apiClient.listCandidates(page: page, size: size);

    final companions = response.items.map((dto) => dto.toDomain().toCompanion()).toList();
    await candidatesDao.upsertAll(companions);

    final candidates = await mapRowsAsync(await candidatesDao.getAll());
    return Page(items: candidates, page: response.page, size: response.size, total: response.total);
  }

  @override
  Future<Candidate> fetchCandidate(String id) async {
    final dto = await apiClient.getCandidate(id: id);
    final candidate = dto.toDomain();
    await candidatesDao.upsert(candidate.toCompanion());
    return candidate;
  }

  @override
  Future<Candidate> updateCandidate({
    required String id,
    required int version,
    CandidateStatus? status,
    String? note,
  }) async {
    // Mirror table is never touched here — the change lives in the outbox and
    // is overlaid on reads. The mirror only changes on confirmed sync.
    await outboxDao.insert(
      OutboxTableCompanion(
        candidateId: Value(id),
        baseVersion: Value(version),
        status: Value(status?.apiKey),
        note: Value(note),
        clientUpdatedAt: Value(DateTime.now()),
      ),
    );

    final row = await candidatesDao.watchById(id).first;
    if (row == null) throw StateError('Candidate $id not found');
    final pending = await outboxDao.getPending();
    return _applyOverlay([row], pending).first.toDomain();
  }

  @override
  Future<SyncResult> sync() => syncEngine.run();

  /// Overlays the latest pending outbox change per candidate onto mirror rows.
  List<CandidatesTableData> _applyOverlay(List<CandidatesTableData> rows, List<OutboxTableData> pending) {
    if (pending.isEmpty) return rows;

    final latest = <String, OutboxTableData>{};
    for (final p in pending) {
      final existing = latest[p.candidateId];
      if (existing == null || p.clientUpdatedAt.isAfter(existing.clientUpdatedAt)) {
        latest[p.candidateId] = p;
      }
    }

    return rows.map((row) {
      final change = latest[row.id];
      if (change == null) return row;
      return row.copyWith(status: change.status ?? row.status, note: Value(change.note ?? row.note));
    }).toList();
  }
}
