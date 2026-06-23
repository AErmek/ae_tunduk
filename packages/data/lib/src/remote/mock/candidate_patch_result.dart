typedef CandidateRecord = Map<String, dynamic>;

enum CandidatePatchStatus { applied, conflict, notFound }

class CandidatePatchResult {
  const CandidatePatchResult._(this.status, this.record);

  factory CandidatePatchResult.applied(CandidateRecord record) =>
      CandidatePatchResult._(CandidatePatchStatus.applied, record);

  factory CandidatePatchResult.conflict(CandidateRecord current) =>
      CandidatePatchResult._(CandidatePatchStatus.conflict, current);

  static const CandidatePatchResult notFound = CandidatePatchResult._(CandidatePatchStatus.notFound, null);

  final CandidatePatchStatus status;
  final CandidateRecord? record;
}
