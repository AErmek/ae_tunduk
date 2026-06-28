final class ApiConfig {
  const ApiConfig();

  static const String _baseUrl = String.fromEnvironment('BASE_URL', defaultValue: 'https://api.cv-scan.local/v1');
  static const int connectTimeoutMs = 10000;
  static const int receiveTimeoutMs = 15000;

  static const String _mockConflictStrategy = String.fromEnvironment('MOCK_CONFLICT_STRATEGY', defaultValue: 'merge');

  static const String _mockAssetPath = 'packages/cv_scan_data/assets/mock/candidates.json';
  static const String _mockLargeAssetPath = 'packages/cv_scan_data/assets/mock/candidates-large.json';
  static const bool _mockUseLargeAsset = bool.fromEnvironment('MOCK_USE_LARGE_ASSET', defaultValue: false);

  String get baseUrl => _baseUrl;
  String get mockAssetPath => _mockUseLargeAsset ? _mockLargeAssetPath : _mockAssetPath;
  String get mockConflictStrategy => _mockConflictStrategy;
}
