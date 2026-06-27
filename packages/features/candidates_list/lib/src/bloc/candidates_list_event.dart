part of 'candidates_list_bloc.dart';

@freezed
sealed class CandidatesListEvent with _$CandidatesListEvent {
  const factory CandidatesListEvent.started() = _Started;
  const factory CandidatesListEvent.nextPageRequested() = _NextPageRequested;
  const factory CandidatesListEvent.refreshed() = _Refreshed;
  const factory CandidatesListEvent.verdictChanged(CandidateVerdict? verdict) = _VerdictChanged;
  const factory CandidatesListEvent.queryChanged(String query) = _QueryChanged;
  const factory CandidatesListEvent.sortChanged(SortField sort) = _SortChanged;
  const factory CandidatesListEvent.candidatesUpdated(List<Candidate> items) = _CandidatesUpdated;
  const factory CandidatesListEvent.onlineChanged(bool isOnline) = _OnlineChanged;
}
