import 'package:cv_scan_domain/src/entities/sync_snapshot.dart';

/// Decides when to flush the outbox and retries failed passes with backoff.
abstract interface class SyncScheduler {
  /// Start watching triggers.
  void start();

  /// Stop watching and cancel any pending retry.
  void stop();

  /// Run a sync now.
  void triggerNow();

  /// Current sync state.
  Stream<SyncSnapshot> get snapshot;
}
