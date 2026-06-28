import 'package:cv_scan_domain/src/entities/sync_snapshot.dart';
import 'package:cv_scan_domain/src/services/sync/sync_scheduler.dart';

class WatchSyncSnapshotUseCase {
  const WatchSyncSnapshotUseCase(this._scheduler);

  final SyncScheduler _scheduler;

  Stream<SyncSnapshot> call() => _scheduler.snapshot;
}
