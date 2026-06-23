import 'package:cv_scan_core/cv_scan_core.dart';

enum CandidateStatus implements HasApiKey {
  newCandidate('new'),
  review('review'),
  invited('invited'),
  rejected('rejected');

  @override
  final String apiKey;

  const CandidateStatus(this.apiKey);

  static CandidateStatus get defaultValue => CandidateStatus.newCandidate;
}
