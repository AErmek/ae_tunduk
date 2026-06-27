import 'package:cv_scan_domain/src/entities/candidate.dart';
import 'package:cv_scan_domain/src/entities/candidates_filter.dart';
import 'package:cv_scan_domain/src/repositories/candidate_repository.dart';

class GetCandidatesUseCase {
  const GetCandidatesUseCase(this._repository);

  final CandidateRepository _repository;

  Stream<List<Candidate>> call(CandidatesFilter filter) => _repository.watchCandidates(filter);
}
