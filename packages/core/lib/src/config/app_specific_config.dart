final class AppSpecificConfig {
  const AppSpecificConfig();

  static const String _appTitle = String.fromEnvironment('APP_TITLE');
  static const int _pinCodeLength = int.fromEnvironment('PIN_CODE_LENGTH', defaultValue: 4);

  String get appTitle => _appTitle;
  int get pinCodeLength => _pinCodeLength;
}
