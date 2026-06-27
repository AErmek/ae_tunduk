/// Tracks real internet reachability (not just the network interface state).
abstract interface class NetworkMonitor {
  /// Latest known reachability.
  bool get isOnline;

  /// Emits on every reachability change.
  Stream<bool> get onlineChanges;
}
