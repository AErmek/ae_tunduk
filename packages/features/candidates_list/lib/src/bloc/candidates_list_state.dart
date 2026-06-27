part of 'candidates_list_bloc.dart';

@freezed
abstract class CandidatesListState with _$CandidatesListState {
  const factory CandidatesListState({
    @Default(<Candidate>[]) List<Candidate> items,
    @Default(CandidatesFilter()) CandidatesFilter filter,
    @Default(true) bool hasMore,
    @Default(true) bool isOnline,
    @Default(RequestStatus<int>.idle()) RequestStatus<int> loadMore,
    @Default(RequestStatus<int>.idle()) RequestStatus<int> refresh,
  }) = _CandidatesListState;
}
