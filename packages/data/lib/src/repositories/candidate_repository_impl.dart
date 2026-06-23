import 'dart:async';
import 'dart:convert';

import 'package:cv_scan_data/src/local/dao/candidates_dao.dart';
import 'package:cv_scan_data/src/local/dao/outbox_dao.dart';
import 'package:cv_scan_data/src/local/database/app_database.dart';
import 'package:cv_scan_data/src/local/mappers/candidate_local_mapper.dart';
import 'package:cv_scan_data/src/remote/generated/api/api_client.dart';
import 'package:cv_scan_data/src/remote/generated/models/sync_request.dart';
import 'package:cv_scan_data/src/remote/generated/models/sync_request_changes.dart';
import 'package:cv_scan_data/src/remote/generated/models/sync_request_changes_status_status.dart';
import 'package:cv_scan_data/src/remote/mappers/candidate_mapper.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:drift/drift.dart';

class CandidateRepositoryImpl implements CandidateRepository {
  CandidateRepositoryImpl({required this.apiClient, required this.candidatesDao, required this.outboxDao});

  final ApiClient apiClient;
  final CandidatesDao candidatesDao;
  final OutboxDao outboxDao;

  @override
  Stream<List<Candidate>> watchCandidates({
    required int page,
    required int size,
    CandidateVerdict? verdict,
    String? query,
    SortField sort = SortField.dateAdded,
  }) {
    return candidatesDao.watchAll().asyncMap((rows) => mapRowsAsync(rows));
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

    final companions = response.items.map((dto) => _toCompanion(dto.toDomain())).toList();
    await candidatesDao.upsertAll(companions);

    final candidates = await mapRowsAsync(await candidatesDao.getAll());
    return Page(items: candidates, page: response.page, size: response.size, total: response.total);
  }

  @override
  Stream<Candidate?> watchCandidate(String id) {
    return candidatesDao.watchById(id).map((row) => row?.toDomain());
  }

  @override
  Future<Candidate> fetchCandidate(String id) async {
    final dto = await apiClient.getCandidate(id: id);
    final candidate = dto.toDomain();
    await candidatesDao.upsert(_toCompanion(candidate));
    return candidate;
  }

  @override
  Future<Candidate> updateCandidate({
    required String id,
    required int version,
    CandidateStatus? status,
    String? note,
  }) async {
    final existing = await candidatesDao.watchById(id).first;
    if (existing == null) throw Exception('Candidate $id not found');

    final optimisticStatus = status?.apiKey ?? existing.status;
    await candidatesDao.updateStatusAndNote(
      id: id,
      status: optimisticStatus,
      note: note ?? existing.note,
      version: version,
    );

    await outboxDao.insert(
      OutboxTableCompanion(
        candidateId: Value(id),
        baseVersion: Value(version),
        status: Value(status?.apiKey),
        note: Value(note),
        clientUpdatedAt: Value(DateTime.now()),
      ),
    );

    return candidatesDao.watchById(id).first.then((row) => row!.toDomain());
  }

  @override
  Future<SyncResult> sync() async {
    final pending = await outboxDao.getPending();
    if (pending.isEmpty) return const SyncResult(applied: [], conflicts: []);

    final changes = pending
        .map(
          (row) => SyncRequestChanges(
            id: row.candidateId,
            baseVersion: row.baseVersion,
            status: row.status != null ? SyncRequestChangesStatusStatus.fromJson(row.status!) : null,
            note: row.note,
            clientUpdatedAt: row.clientUpdatedAt,
          ),
        )
        .toList();

    final response = await apiClient.postSync(body: SyncRequest(changes: changes));

    for (final candidate in response.applied) {
      await candidatesDao.upsert(_toCompanion(candidate.toDomain()));
      await outboxDao.deleteForCandidate(candidate.id);
    }

    final conflicts = response.conflicts.map((c) => c.toDomain()).toList();

    for (final conflict in conflicts) {
      await candidatesDao.upsert(_toCompanion(conflict.current));
      await outboxDao.deleteForCandidate(conflict.id);
    }

    return SyncResult(applied: response.applied.map((c) => c.toDomain()).toList(), conflicts: conflicts);
  }

  CandidatesTableCompanion _toCompanion(Candidate c) {
    return CandidatesTableCompanion(
      id: Value(c.id),
      name: Value(c.name),
      position: Value(c.position),
      posLabel: Value(c.posLabel),
      verdict: Value(c.verdict.apiKey),
      vc: Value(c.verdictColor.apiKey),
      status: Value(c.status.apiKey),
      version: Value(c.version),
      file: Value(c.file),
      email: Value(c.email),
      phone: Value(c.phone),
      city: Value(c.city),
      tg: Value(c.tg),
      exp: Value(c.exp != null ? jsonEncode(c.exp) : null),
      totalExp: Value(c.totalExp),
      stack: Value(c.stack),
      edu: Value(c.edu),
      criteria: Value(c.criteria != null ? jsonEncode(c.criteria) : null),
      summary: Value(c.summary),
      questions: Value(c.questions != null ? jsonEncode(c.questions) : null),
      note: Value(c.note),
      dateAdded: Value(c.dateAdded),
    );
  }
}
