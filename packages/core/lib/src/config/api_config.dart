final class ApiConfig {
  const ApiConfig();

  static const String _baseUrl = String.fromEnvironment('BASE_URL', defaultValue: 'https://api.cv-scan.local/v1');
  static const int connectTimeoutMs = 10000;
  static const int receiveTimeoutMs = 15000;

  String get baseUrl => _baseUrl;
}
