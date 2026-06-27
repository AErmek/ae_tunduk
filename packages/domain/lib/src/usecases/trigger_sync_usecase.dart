import 'package:cv_scan_domain/src/services/sync/sync_scheduler.dart';

/// Requests an immediate sync (manual pull-to-sync). Orchestration — passes,
/// retries, deduplication — is the scheduler's responsibility.
class TriggerSyncUseCase {
  const TriggerSyncUseCase(this._scheduler);

  final SyncScheduler _scheduler;

  void call() => _scheduler.triggerNow();
}
