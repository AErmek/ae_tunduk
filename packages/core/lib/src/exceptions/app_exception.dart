abstract base class AppException implements Exception {
  AppException([this.message = '']);

  final String message;

  @override
  String toString() {
    final message = this.message;
    if (message.isEmpty) return 'AppException';
    return message;
  }
}
