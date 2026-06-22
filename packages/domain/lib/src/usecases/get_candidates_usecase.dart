import 'package:cv_scan_domain/src/entities/candidate.dart';
import 'package:cv_scan_domain/src/enums/candidate_verdict.dart';
import 'package:cv_scan_domain/src/enums/sort_field.dart';
import 'package:cv_scan_domain/src/repositories/candidate_repository.dart';

class GetCandidatesUseCase {
  const GetCandidatesUseCase(this._repository);

  final CandidateRepository _repository;

  Stream<List<Candidate>> call({
    int page = 0,
    int size = 10,
    CandidateVerdict? verdict,
    String? query,
    SortField sort = SortField.dateAdded,
  }) {
    return _repository.watchCandidates(
      page: page,
      size: size,
      verdict: verdict,
      query: query,
      sort: sort,
    );
  }
}
