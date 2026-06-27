import 'package:cv_scan_data/src/local/dao/candidates_dao.dart';
import 'package:cv_scan_data/src/local/dao/outbox_dao.dart';
import 'package:cv_scan_data/src/local/database/app_database.dart';
import 'package:cv_scan_data/src/local/mappers/candidate_local_mapper.dart';
import 'package:cv_scan_data/src/remote/generated/models/sync_response.dart';
import 'package:cv_scan_data/src/remote/mappers/candidate_mapper.dart';
import 'package:cv_scan_data/src/services/sync/conflict_resolution.dart';
import 'package:cv_scan_data/src/services/sync/conflict_resolver.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:drift/drift.dart';

/// Persists a sync response atomically. Accepted changes land in the mirror and
/// leave the outbox; conflicts converge the mirror to server truth and re-enqueue
/// the local intent per [strategy]. Everything runs in one transaction, so a
/// crash can never leave a change half-applied (e.g. deleted but not rebased).
class SyncReconciler {
  const SyncReconciler({
    required this.db,
    required this.candidatesDao,
    required this.outboxDao,
    this.resolver = const ConflictResolver(),
    this.strategy = ConflictStrategy.serverWins,
  });

  final AppDatabase db;
  final CandidatesDao candidatesDao;
  final OutboxDao outboxDao;
  final ConflictResolver resolver;
  final ConflictStrategy strategy;

  Future<SyncPass> reconcile(SyncResponse response, Map<String, OutboxTableData> pendingByCandidate) =>
      db.transaction(() async {
        final applied = await _applyAccepted(response);
        final (conflicts, rebased) = await _applyConflicts(response, pendingByCandidate);
        return SyncPass(applied: applied, conflicts: conflicts, rebased: rebased);
      });

  Future<List<Candidate>> _applyAccepted(SyncResponse response) async {
    final applied = <Candidate>[];
    for (final dto in response.applied) {
      final candidate = dto.toDomain();
      await candidatesDao.upsert(candidate.toCompanion());
      await outboxDao.deleteForCandidate(candidate.id);
      applied.add(candidate);
    }
    return applied;
  }

  Future<(List<SyncConflict>, bool)> _applyConflicts(
    SyncResponse response,
    Map<String, OutboxTableData> pendingByCandidate,
  ) async {
    final conflicts = <SyncConflict>[];
    var rebased = false;

    for (final dto in response.conflicts) {
      final conflict = dto.toDomain();
      await candidatesDao.upsert(conflict.current.toCompanion());
      await outboxDao.deleteForCandidate(conflict.id);

      final local = pendingByCandidate[conflict.id];
      final resolution = resolver.resolve(
        strategy: strategy,
        conflict: conflict,
        localStatus: local?.status,
        localNote: local?.note,
      );

      if (resolution case Rebase(:final baseVersion, :final status, :final note)) {
        await outboxDao.insert(
          OutboxTableCompanion(
            candidateId: Value(conflict.id),
            baseVersion: Value(baseVersion),
            status: Value(status),
            note: Value(note),
            clientUpdatedAt: Value(DateTime.now()),
          ),
        );
        rebased = true;
      }

      conflicts.add(conflict);
    }

    return (conflicts, rebased);
  }
}
