import 'package:cv_scan_domain/cv_scan_domain.dart';

/// Remote source of candidates. Hides the REST client and DTO mapping —
/// speaks only in domain types.
abstract interface class CandidateRemoteDataSource {
  Future<Page<Candidate>> fetchCandidates({required int page, required int size});

  Future<Candidate> fetchCandidate(String id);
}
