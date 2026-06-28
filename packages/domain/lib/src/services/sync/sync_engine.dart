import 'package:cv_scan_domain/src/entities/sync_pass.dart';

/// Runs one sync pass: post pending changes, apply results, resolve conflicts.
abstract interface class SyncEngine {
  /// Runs one pass. Transient failures rethrow so a retry can replay them.
  Future<SyncPass> runOnce();
}
