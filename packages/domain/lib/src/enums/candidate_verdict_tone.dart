import 'package:cv_scan_core/cv_scan_core.dart';

enum CandidateVerdictTone implements HasApiKey {
  green('verdict-green'),
  orange('verdict-orange'),
  red('verdict-red');

  const CandidateVerdictTone(this.apiKey);

  @override
  final String apiKey;

  static CandidateVerdictTone get defaultValue => CandidateVerdictTone.red;

  static CandidateVerdictTone byApiKey(String value, {CandidateVerdictTone? defaultValue}) =>
      CandidateVerdictTone.values.byApiKeyOrDefault(value, defaultValue: defaultValue ?? CandidateVerdictTone.defaultValue);
}
