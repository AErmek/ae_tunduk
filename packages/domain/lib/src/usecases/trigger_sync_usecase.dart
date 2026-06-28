import 'package:cv_scan_domain/src/services/sync/sync_scheduler.dart';

/// Asks for an immediate sync (e.g. pull-to-refresh).
class TriggerSyncUseCase {
  const TriggerSyncUseCase(this._scheduler);

  final SyncScheduler _scheduler;

  void call() => _scheduler.triggerNow();
}
