final class AppSpecificConfig {
  const AppSpecificConfig();

  static const String _appTitle = String.fromEnvironment('APP_TITLE');
  static const int _pinCodeLength = int.fromEnvironment('PIN_CODE_LENGTH', defaultValue: 4);

  static const String _shareBaseUrl = String.fromEnvironment('SHARE_BASE_URL', defaultValue: 'https://cvscan.ae.kg');

  String get appTitle => _appTitle;
  int get pinCodeLength => _pinCodeLength;

  String get shareBaseUrl => _shareBaseUrl;
  String shareCandidateUrl(String id) => '$_shareBaseUrl/candidates/$id';
}
