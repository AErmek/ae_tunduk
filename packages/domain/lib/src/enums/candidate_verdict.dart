import 'package:cv_scan_core/cv_scan_core.dart';

enum CandidateVerdict implements HasApiKey {
  fits('ПОДХОДИТ'),
  partial('ЧАСТИЧНО'),
  doesNotFit('НЕ ПОДХОДИТ');

  const CandidateVerdict(this.apiKey);

  @override
  final String apiKey;

  static CandidateVerdict get defaultValue => CandidateVerdict.doesNotFit;

  static CandidateVerdict byApiKey(String value, {CandidateVerdict? defaultValue}) =>
      CandidateVerdict.values.byApiKeyOrDefault(value, defaultValue: defaultValue ?? CandidateVerdict.defaultValue);
}
