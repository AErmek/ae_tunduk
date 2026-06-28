part of 'candidate_detail_bloc.dart';

@freezed
sealed class CandidateDetailEvent with _$CandidateDetailEvent {
  const factory CandidateDetailEvent.started() = _Started;
  const factory CandidateDetailEvent.candidateUpdated(Candidate? candidate) = _CandidateUpdated;
  const factory CandidateDetailEvent.statusChanged(CandidateStatus status) = _StatusChanged;
  const factory CandidateDetailEvent.noteSubmitted(String note) = _NoteSubmitted;
  const factory CandidateDetailEvent.pendingChanged({required bool hasPending}) = _PendingChanged;
  const factory CandidateDetailEvent.onlineChanged({required bool isOnline}) = _OnlineChanged;
  const factory CandidateDetailEvent.shareRequested() = _ShareRequested;
}
