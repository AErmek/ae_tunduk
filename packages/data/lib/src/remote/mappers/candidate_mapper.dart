import 'package:cv_scan_data/src/remote/generated/models/candidate.dart' as dto;
import 'package:cv_scan_data/src/remote/generated/models/conflict.dart' as dto;
import 'package:cv_scan_domain/cv_scan_domain.dart';

extension CandidateDtoMapper on dto.Candidate {
  Candidate toDomain() => Candidate(
    id: id,
    name: name,
    position: position,
    posLabel: posLabel,
    verdict: CandidateVerdict.byApiKey(verdict.json ?? ''),
    verdictTone: CandidateVerdictTone.byApiKey(vc.json ?? ''),
    status: CandidateStatus.byApiKey(status.json ?? ''),
    version: version,
    file: file,
    email: email,
    phone: phone,
    city: city,
    tg: tg,
    exp: exp,
    totalExp: totalExp,
    stack: stack,
    edu: edu,
    criteria: criteria,
    summary: summary,
    questions: questions,
    note: note,
    dateAdded: dateAdded,
  );
}

extension ConflictDtoMapper on dto.Conflict {
  SyncConflict toDomain() => SyncConflict(id: id, currentVersion: currentVersion, current: current.toDomain());
}
