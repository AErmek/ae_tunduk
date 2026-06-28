import 'package:cv_scan_domain/src/entities/candidate_light.dart';
import 'package:cv_scan_domain/src/entities/candidates_filter.dart';
import 'package:cv_scan_domain/src/entities/page.dart';
import 'package:cv_scan_domain/src/repositories/candidate_repository.dart';

/// Fetches a remote page into the local mirror.
class FetchCandidatesUseCase {
  const FetchCandidatesUseCase(this._repository);

  final CandidateRepository _repository;

  Future<Page<CandidateLight>> call(CandidatesFilter filter) => _repository.fetchCandidates(filter);
}
