import 'package:cv_scan_domain/src/entities/candidate.dart';
import 'package:cv_scan_domain/src/entities/candidates_filter.dart';
import 'package:cv_scan_domain/src/entities/page.dart';
import 'package:cv_scan_domain/src/repositories/candidate_repository.dart';

/// Pulls a remote page into the local mirror. Throws a [Failure] on transport
/// errors (mapped in the data layer).
class FetchCandidatesUseCase {
  const FetchCandidatesUseCase(this._repository);

  final CandidateRepository _repository;

  Future<Page<Candidate>> call(CandidatesFilter filter) => _repository.fetchCandidates(filter);
}
