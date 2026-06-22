import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:cv_scan_domain/src/entities/candidate.dart';
import 'package:cv_scan_domain/src/enums/candidate_verdict.dart';
import 'package:cv_scan_domain/src/enums/sort_field.dart';
import 'package:cv_scan_domain/src/repositories/candidate_repository.dart';

class GetCandidatesUseCase {
  const GetCandidatesUseCase(this._repository);

  final CandidateRepository _repository;

  Stream<List<Candidate>> call({
    int? page,
    int? size,
    CandidateVerdict? verdict,
    String? query,
    SortField sort = SortField.dateAdded,
  }) {
    return _repository.watchCandidates(
      page: page ?? Config.i.pagination.defaultPage,
      size: size ?? Config.i.pagination.defaultPageSize,
      verdict: verdict,
      query: query,
      sort: sort,
    );
  }
}
