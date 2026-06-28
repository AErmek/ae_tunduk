import 'package:cv_scan_domain/src/enums/candidate_verdict.dart';
import 'package:cv_scan_domain/src/enums/sort_field.dart';
import 'package:equatable/equatable.dart';

/// Pagination and filter criteria for the candidates list.
class CandidatesFilter extends Equatable {
  const CandidatesFilter({
    this.page = 0,
    this.size = 20,
    this.verdict,
    this.query = '',
    this.sort = SortField.dateAdded,
  });

  /// 0-based index of the last loaded page.
  final int page;
  final int size;
  final CandidateVerdict? verdict;
  final String query;
  final SortField sort;

  /// Total rows to load for pages 0..page.
  int get limit => (page + 1) * size;

  CandidatesFilter copyWith({
    int? page,
    int? size,
    CandidateVerdict? verdict,
    bool resetVerdict = false,
    String? query,
    SortField? sort,
  }) => CandidatesFilter(
    page: page ?? this.page,
    size: size ?? this.size,
    verdict: resetVerdict ? null : (verdict ?? this.verdict),
    query: query ?? this.query,
    sort: sort ?? this.sort,
  );

  /// Back to the first page.
  CandidatesFilter firstPage() => copyWith(page: 0);

  @override
  List<Object?> get props => [page, size, verdict, query, sort];
}
