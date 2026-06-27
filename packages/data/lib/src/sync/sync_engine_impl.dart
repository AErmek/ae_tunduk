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
import 'package:cv_scan_data/src/sync/conflict_resolution.dart';
import 'package:cv_scan_data/src/sync/conflict_resolver.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';

/// Single-pass sync engine: one POST, apply accepted, resolve conflicts. It is
/// idempotent — pending rows survive transient failures so the scheduler can
/// replay them — and never loops or sleeps on its own.
class SyncEngineImpl implements SyncEngine {
  SyncEngineImpl({
    required this.apiClient,
    required this.candidatesDao,
    required this.outboxDao,
    this.conflictResolver = const ConflictResolver(),
    this.strategy = ConflictStrategy.serverWins,
  });

  final ApiClient apiClient;
  final CandidatesDao candidatesDao;
  final OutboxDao outboxDao;
  final ConflictResolver conflictResolver;
  final ConflictStrategy strategy;

  @override
  Future<SyncPass> runOnce() async {
    final pending = await outboxDao.getPending();
    if (pending.isEmpty) return SyncPass.empty;

    final response = await _post(pending, _coalesce(pending));

    final applied = await _applyAccepted(response);
    final (conflicts, rebased) = await _applyConflicts(response);

    return SyncPass(applied: applied, conflicts: conflicts, rebased: rebased);
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

  /// Posts once. Transient errors rethrow with the outbox untouched (the
  /// scheduler retries). A poisoned change — anything non-transient — is marked
  /// failed so it leaves the pending set and can't loop forever.
  Future<SyncResponse> _post(List<OutboxTableData> pending, List<SyncRequestChanges> changes) async {
    try {
      return await apiClient.postSync(body: SyncRequest(changes: changes));
    } on DioException catch (e) {
      if (_isTransient(e)) rethrow;
      await _markFailed(pending, e.message ?? e.type.name);
      rethrow;
    } catch (e) {
      await _markFailed(pending, e.toString());
      rethrow;
    }
  }

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

  /// Converges the mirror to server truth and applies the conflict strategy.
  /// Returns the conflicts plus whether any was rebased (re-enqueued), which
  /// signals that another pass could still make progress.
  Future<(List<SyncConflict>, bool)> _applyConflicts(SyncResponse response) async {
    final conflicts = <SyncConflict>[];
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

      conflicts.add(conflict);
    }

    return (conflicts, rebasedAny);
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
