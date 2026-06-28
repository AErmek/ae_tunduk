/// Test utility that manufactures sync conflicts.
///
/// Rewrites the server copy of every candidate that has a pending local
/// change — bumping its version — so the next sync sees a stale baseVersion.
abstract interface class ServerConflictSimulator {
  /// Mutates the server records for all pending outbox entries.
  /// Returns the number of candidates changed on the server.
  Future<int> conflictPending();
}
