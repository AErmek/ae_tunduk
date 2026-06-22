import 'package:cv_scan_domain/src/entities/candidate.dart';
import 'package:cv_scan_domain/src/repositories/candidate_repository.dart';

class GetCandidateUseCase {
  const GetCandidateUseCase(this._repository);

  final CandidateRepository _repository;

  Stream<Candidate?> call(String id) => _repository.watchCandidate(id);
}
