import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:cv_scan_data/src/remote/generated/models/candidate.dart' as dto;
import 'package:cv_scan_data/src/remote/generated/models/candidate_status_status.dart';
import 'package:cv_scan_data/src/remote/generated/models/candidate_vc_vc.dart';
import 'package:cv_scan_data/src/remote/generated/models/candidate_verdict_verdict.dart';
import 'package:cv_scan_data/src/remote/generated/models/conflict.dart' as dto;
import 'package:cv_scan_domain/cv_scan_domain.dart';

extension CandidateDtoMapper on dto.Candidate {
  Candidate toDomain() => Candidate(
    id: id,
    name: name,
    position: position,
    posLabel: posLabel,
    verdict: verdict.toDomain(),
    verdictColor: vc.toDomain(),
    status: status.toDomain(),
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

extension CandidateVerdictMapper on CandidateVerdictVerdict {
  CandidateVerdict toDomain() =>
      CandidateVerdict.values.byApiKeyOrDefault(json ?? '', defaultValue: CandidateVerdict.defaultValue);
}

extension CandidateVcMapper on CandidateVcVc {
  VerdictColor toDomain() => VerdictColor.values.byApiKeyOrDefault(json ?? '', defaultValue: VerdictColor.defaultValue);
}

extension CandidateStatusMapper on CandidateStatusStatus {
  CandidateStatus toDomain() =>
      CandidateStatus.values.byApiKeyOrDefault(json ?? '', defaultValue: CandidateStatus.defaultValue);
}

extension ConflictDtoMapper on dto.Conflict {
  SyncConflict toDomain() => SyncConflict(id: id, currentVersion: currentVersion, current: current.toDomain());
}
