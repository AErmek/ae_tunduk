import 'package:cv_scan_core/cv_scan_core.dart';

enum CandidateStatus implements HasApiKey {
  newCandidate('new'),
  review('review'),
  invited('invited'),
  rejected('rejected');

  const CandidateStatus(this.apiKey);

  @override
  final String apiKey;

  static CandidateStatus get defaultValue => CandidateStatus.newCandidate;

  static CandidateStatus byApiKey(String value, {CandidateStatus? defaultValue}) =>
      CandidateStatus.values.byApiKeyOrDefault(value, defaultValue: defaultValue ?? CandidateStatus.defaultValue);
}
