import 'package:cv_scan_domain/src/entities/sync_pass.dart';

/// Runs a single idempotent sync pass: posts the coalesced pending changes,
/// applies accepted results and resolves conflicts. Orchestration — how many
/// passes, when to retry and with what delay — lives in the scheduler.
abstract interface class SyncEngine {
  /// Performs one pass. Transient (network) failures throw with the outbox
  /// untouched so a retry can replay them; poisoned changes are marked failed.
  Future<SyncPass> runOnce();
}
