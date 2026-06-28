import 'package:cv_scan_domain/src/entities/candidate.dart';
import 'package:cv_scan_domain/src/repositories/candidate_repository.dart';

class FetchCandidateUseCase {
  const FetchCandidateUseCase(this._repository);

  final CandidateRepository _repository;

  Future<Candidate> call(String id) => _repository.fetchCandidate(id);
}
