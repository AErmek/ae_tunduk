import 'package:cv_scan_domain/src/entities/sync_snapshot.dart';

/// Drives background synchronization: decides *when* to flush the outbox
/// (pending changes appear, connectivity returns, app resumes), deduplicates
/// concurrent runs and retries failed passes with backoff.
abstract interface class SyncScheduler {
  /// Begins watching triggers. Idempotent.
  void start();

  /// Stops watching and cancels any scheduled retry.
  void stop();

  /// Requests an immediate flush (e.g. app resume or manual pull-to-sync).
  void triggerNow();

  /// Current sync state, replayed to new listeners.
  Stream<SyncSnapshot> get snapshot;
}
