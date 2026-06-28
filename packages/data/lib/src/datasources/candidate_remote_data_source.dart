import 'package:cv_scan_domain/cv_scan_domain.dart';

/// Remote candidates: hides the REST client and DTO mapping.
abstract interface class CandidateRemoteDataSource {
  Future<Page<Candidate>> fetchCandidates({required int page, required int size});

  Future<Candidate> fetchCandidate(String id);
}
