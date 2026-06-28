import 'package:cv_scan_domain/cv_scan_domain.dart';

/// Test [Candidate] with stable defaults.
Candidate candidate({
  String id = 'c1',
  int version = 1,
  CandidateStatus status = CandidateStatus.newCandidate,
  String? note,
}) => Candidate(
  id: id,
  name: 'Jane Doe',
  position: 'flutter',
  posLabel: 'Flutter Engineer',
  verdict: CandidateVerdict.defaultValue,
  verdictTone: CandidateVerdictTone.defaultValue,
  status: status,
  version: version,
  note: note,
);

SyncConflict syncConflict({String id = 'c1', int currentVersion = 5, Candidate? current}) =>
    SyncConflict(id: id, currentVersion: currentVersion, current: current ?? candidate(id: id, version: currentVersion));
