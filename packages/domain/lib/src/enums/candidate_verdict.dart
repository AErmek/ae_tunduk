import 'package:cv_scan_core/cv_scan_core.dart';

enum CandidateVerdict implements HasApiKey {
  fits('ПОДХОДИТ'),
  partial('ЧАСТИЧНО'),
  doesNotFit('НЕ ПОДХОДИТ');

  @override
  final String apiKey;

  const CandidateVerdict(this.apiKey);

  static CandidateVerdict get defaultValue => CandidateVerdict.doesNotFit;
}
