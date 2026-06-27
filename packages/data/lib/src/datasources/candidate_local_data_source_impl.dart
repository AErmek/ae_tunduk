import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:cv_scan_data/src/datasources/candidate_local_data_source.dart';
import 'package:cv_scan_data/src/local/dao/candidates_dao.dart';
import 'package:cv_scan_data/src/local/dao/outbox_dao.dart';
import 'package:cv_scan_data/src/local/database/app_database.dart';
import 'package:cv_scan_data/src/local/mappers/candidate_local_mapper.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:drift/drift.dart';

class CandidateLocalDataSourceImpl implements CandidateLocalDataSource {
  CandidateLocalDataSourceImpl({required this._candidatesDao, required this._outboxDao});

  final CandidatesDao _candidatesDao;
  final OutboxDao _outboxDao;

  @override
  Stream<List<CandidateLight>> watchCandidates({
    required int limit,
    CandidateVerdict? verdict,
    String? query,
    SortField sort = SortField.dateAdded,
  }) {
    final overlaid = combineLatest2(
      _candidatesDao.watchPage(limit: limit, verdict: verdict, query: query, sort: sort),
      _outboxDao.watchPending(),
      _applyOverlay,
    );
    return overlaid.map(mapLightRows);
  }

  @override
  Stream<Candidate?> watchCandidate(String id) =>
      combineLatest2(_candidatesDao.watchById(id), _outboxDao.watchPending(), (row, pending) {
        if (row == null) return null;
        return _applyOverlay([row], pending).first;
      }).map((row) => row?.toDomain());

  @override
  Stream<bool> watchCandidatePending(String id) => _outboxDao.watchHasPendingForCandidate(id);

  @override
  Future<Candidate?> getCandidate(String id) async {
    final row = await _candidatesDao.watchById(id).first;
    if (row == null) return null;
    final pending = await _outboxDao.getPending();
    return _applyOverlay([row], pending).first.toDomain();
  }

  @override
  Future<List<Candidate>> getCandidates() async => mapRows(await _candidatesDao.getAll());

  @override
  Future<void> cacheCandidates(List<Candidate> candidates) =>
      _candidatesDao.upsertAll(candidates.map((c) => c.toCompanion()).toList());

  @override
  Future<void> cacheCandidate(Candidate candidate) => _candidatesDao.upsert(candidate.toCompanion());

  @override
  Future<void> enqueueUpdate({
    required String id,
    required int version,
    CandidateStatus? status,
    String? note,
  }) => _outboxDao.upsertPending(candidateId: id, baseVersion: version, status: status?.apiKey, note: note);

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
