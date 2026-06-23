import 'package:cv_scan_core/cv_scan_core.dart';

enum VerdictColor implements HasApiKey {
  green('verdict-green'),
  orange('verdict-orange'),
  red('verdict-red');

  const VerdictColor(this.apiKey);

  @override
  final String apiKey;

  static VerdictColor get defaultValue => VerdictColor.red;

  static VerdictColor byApiKey(String value, {VerdictColor? defaultValue}) =>
      VerdictColor.values.byApiKeyOrDefault(value, defaultValue: defaultValue ?? VerdictColor.defaultValue);
}
