final class DatabaseConfig {
  const DatabaseConfig();

  static const String _fileName = String.fromEnvironment(
    'DB_FILE_NAME',
    defaultValue: 'cv_scan',
  );

  String get fileName => _fileName;
}
