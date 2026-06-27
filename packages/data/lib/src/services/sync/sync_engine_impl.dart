import 'package:cv_scan_data/src/local/dao/outbox_dao.dart';
import 'package:cv_scan_data/src/local/database/app_database.dart';
import 'package:cv_scan_data/src/remote/generated/api/api_client.dart';
import 'package:cv_scan_data/src/remote/generated/models/sync_request.dart';
import 'package:cv_scan_data/src/remote/generated/models/sync_request_changes.dart';
import 'package:cv_scan_data/src/remote/generated/models/sync_request_changes_status_status.dart';
import 'package:cv_scan_data/src/remote/generated/models/sync_response.dart';
import 'package:cv_scan_data/src/services/sync/sync_reconciler.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:dio/dio.dart';

/// Single-pass sync engine: collect pending → POST once → hand the response to
/// the reconciler. It owns only the network round-trip and poison handling;
/// local persistence and atomicity live in [SyncReconciler], the rebase/retry
/// orchestration in the scheduler. Idempotent: pending rows survive transient
/// failures so a retry replays them.
class SyncEngineImpl implements SyncEngine {
  SyncEngineImpl({required this.apiClient, required this.outboxDao, required this.reconciler});

  final ApiClient apiClient;
  final OutboxDao outboxDao;
  final SyncReconciler reconciler;

  @override
  Future<SyncPass> runOnce() async {
    final pending = await outboxDao.getPending();
    if (pending.isEmpty) return SyncPass.empty;

    final byCandidate = _latestByCandidate(pending);
    final response = await _post(pending, byCandidate.values);
    return reconciler.reconcile(response, byCandidate);
  }

  /// One change per candidate (latest wins). The outbox keeps a single pending
  /// row per candidate, so this is effectively 1:1 — the fold just stays robust
  /// if that ever changes.
  Map<String, OutboxTableData> _latestByCandidate(List<OutboxTableData> pending) {
    final latest = <String, OutboxTableData>{};
    for (final row in pending) {
      final existing = latest[row.candidateId];
      if (existing == null || row.clientUpdatedAt.isAfter(existing.clientUpdatedAt)) {
        latest[row.candidateId] = row;
      }
    }
    return latest;
  }

  /// Posts once. Transient errors rethrow with the outbox untouched (the
  /// scheduler retries). A poisoned change — anything non-transient — is marked
  /// failed so it leaves the pending set and can't loop forever.
  Future<SyncResponse> _post(List<OutboxTableData> pending, Iterable<OutboxTableData> changes) async {
    try {
      return await apiClient.postSync(body: SyncRequest(changes: changes.map(_toChange).toList()));
    } on DioException catch (e) {
      if (_isTransient(e)) rethrow;
      await _markFailed(pending, e.message ?? e.type.name);
      rethrow;
    } catch (e) {
      await _markFailed(pending, e.toString());
      rethrow;
    }
  }

  SyncRequestChanges _toChange(OutboxTableData row) => SyncRequestChanges(
    id: row.candidateId,
    baseVersion: row.baseVersion,
    status: row.status != null ? SyncRequestChangesStatusStatus.fromJson(row.status!) : null,
    note: row.note,
    clientUpdatedAt: row.clientUpdatedAt,
  );

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
