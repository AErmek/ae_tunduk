class SyncException implements Exception {
  const SyncException(this.message);
  final String message;
  @override
  String toString() => 'SyncException: $message';
}
