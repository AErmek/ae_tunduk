part of 'candidate_detail_bloc.dart';

@freezed
abstract class CandidateDetailState with _$CandidateDetailState {
  const factory CandidateDetailState({
    Candidate? candidate,
    @Default(RequestStatus<int>.idle()) RequestStatus<int> load,
    @Default(RequestStatus<int>.idle()) RequestStatus<int> save,
    @Default(true) bool isOnline,
    @Default(false) bool hasPending,
    @Default(RequestStatus<String>.idle()) RequestStatus<String> share,
  }) = _CandidateDetailState;

  const CandidateDetailState._();

  bool get isReady => candidate != null;
}
