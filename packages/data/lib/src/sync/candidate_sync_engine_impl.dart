import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:cv_scan_data/src/exceptions/sync_fail_exception.dart';
import 'package:cv_scan_data/src/local/dao/candidates_dao.dart';
import 'package:cv_scan_data/src/local/dao/outbox_dao.dart';
import 'package:cv_scan_data/src/local/database/app_database.dart';
import 'package:cv_scan_data/src/local/mappers/candidate_local_mapper.dart';
import 'package:cv_scan_data/src/remote/generated/api/api_client.dart';
import 'package:cv_scan_data/src/remote/generated/models/sync_request.dart';
import 'package:cv_scan_data/src/remote/generated/models/sync_request_changes.dart';
import 'package:cv_scan_data/src/remote/generated/models/sync_request_changes_status_status.dart';
import 'package:cv_scan_data/src/remote/generated/models/sync_response.dart';
import 'package:cv_scan_data/src/remote/mappers/candidate_mapper.dart';
import 'package:cv_scan_data/src/sync/candidate_sync_engine.dart';
import 'package:cv_scan_data/src/sync/conflict_resolution.dart';
import 'package:cv_scan_data/src/sync/conflict_resolver.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';

class CandidateSyncEngineImpl implements CandidateSyncEngine {
  CandidateSyncEngineImpl({
    required this.apiClient,
    required this.candidatesDao,
    required this.outboxDao,
    this.conflictResolver = const ConflictResolver(),
    this.backoff = const ExponentialBackoff(),
    this.strategy = ConflictStrategy.mergeNotes,
    this.maxPasses = 5,
  });

  final ApiClient apiClient;
  final CandidatesDao candidatesDao;
  final OutboxDao outboxDao;
  final ConflictResolver conflictResolver;
  final ExponentialBackoff backoff;
  final ConflictStrategy strategy;
  final int maxPasses;

  @override
  Future<SyncResult> run() async {
    final appliedAll = <Candidate>[];
    final conflictsAll = <SyncConflict>[];

    for (var pass = 0; pass < maxPasses; pass++) {
      final pending = await outboxDao.getPending();
      if (pending.isEmpty) break;

      final changes = _coalesce(pending);
      final response = await _postWithRetry(pending, changes);

      await _applyAccepted(response, appliedAll);
      final rebased = await _applyConflicts(response, conflictsAll);

      // No conflicts were rebased — nothing left that another pass could fix.
      if (!rebased) break;
    }

    return SyncResult(applied: appliedAll, conflicts: conflictsAll);
  }

  /// One pending change per candidate (latest wins). All pending rows for a
  /// candidate share the same baseVersion, so coalescing is safe.
  List<SyncRequestChanges> _coalesce(List<OutboxTableData> pending) {
    final latest = <String, OutboxTableData>{};
    for (final row in pending) {
      final existing = latest[row.candidateId];
      if (existing == null || row.clientUpdatedAt.isAfter(existing.clientUpdatedAt)) {
        latest[row.candidateId] = row;
      }
    }

    return latest.values
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
  }

  Future<SyncResponse> _postWithRetry(List<OutboxTableData> pending, List<SyncRequestChanges> changes) async {
    var attempt = 0;
    while (true) {
      try {
        return await apiClient.postSync(body: SyncRequest(changes: changes));
      } on DioException catch (e) {
        if (!_isTransient(e) || !backoff.hasAttemptsLeft(attempt)) {
          await _markFailed(pending, e.message ?? e.type.name);
          throw SyncFailException(attempt, e.message ?? e.type.name);
        }
        await Future<void>.delayed(backoff.delayFor(attempt));
        attempt++;
      } catch (e) {
        await _markFailed(pending, e.toString());
        rethrow;
      }
    }
  }

  Future<void> _applyAccepted(SyncResponse response, List<Candidate> out) async {
    for (final dto in response.applied) {
      final candidate = dto.toDomain();
      await candidatesDao.upsert(candidate.toCompanion());
      await outboxDao.deleteForCandidate(candidate.id);
      out.add(candidate);
    }
  }

  /// Returns true if any conflict was rebased (re-enqueued for another pass).
  Future<bool> _applyConflicts(SyncResponse response, List<SyncConflict> out) async {
    var rebasedAny = false;

    for (final dtoConflict in response.conflicts) {
      final conflict = dtoConflict.toDomain();
      // Mirror always converges to confirmed server truth.
      await candidatesDao.upsert(conflict.current.toCompanion());

      final pendingForId = await _latestPendingFor(conflict.id);
      final resolution = conflictResolver.resolve(
        strategy: strategy,
        conflict: conflict,
        localStatus: pendingForId?.status,
        localNote: pendingForId?.note,
      );

      await outboxDao.deleteForCandidate(conflict.id);

      switch (resolution) {
        case AcceptServer():
          break;
        case Rebase(:final baseVersion, :final status, :final note):
          await outboxDao.insert(
            OutboxTableCompanion(
              candidateId: Value(conflict.id),
              baseVersion: Value(baseVersion),
              status: Value(status),
              note: Value(note),
              clientUpdatedAt: Value(DateTime.now()),
            ),
          );
          rebasedAny = true;
      }

      out.add(conflict);
    }

    return rebasedAny;
  }

  Future<OutboxTableData?> _latestPendingFor(String candidateId) async {
    final pending = await outboxDao.getPending();
    OutboxTableData? latest;
    for (final row in pending) {
      if (row.candidateId != candidateId) continue;
      if (latest == null || row.clientUpdatedAt.isAfter(latest.clientUpdatedAt)) {
        latest = row;
      }
    }
    return latest;
  }

  Future<void> _markFailed(List<OutboxTableData> pending, String reason) async {
    for (final row in pending) {
      await outboxDao.markFailed(row.id, reason);
    }
  }

  bool _isTransient(DioException e) => switch (e.type) {
    DioExceptionType.connectionError ||
    DioExceptionType.connectionTimeout ||
    DioExceptionType.sendTimeout ||
    DioExceptionType.receiveTimeout => true,
    _ => false,
  };
}
