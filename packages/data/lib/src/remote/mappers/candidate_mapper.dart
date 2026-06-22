import 'package:cv_scan_data/src/remote/generated/models/candidate.dart' as dto;
import 'package:cv_scan_data/src/remote/generated/models/candidate_status_status.dart';
import 'package:cv_scan_data/src/remote/generated/models/candidate_vc_vc.dart';
import 'package:cv_scan_data/src/remote/generated/models/candidate_verdict_verdict.dart';
import 'package:cv_scan_data/src/remote/generated/models/conflict.dart' as dto;
import 'package:cv_scan_domain/cv_scan_domain.dart';

extension CandidateDtoMapper on dto.Candidate {
  Candidate toDomain() {
    return Candidate(
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
}

extension CandidateVerdictMapper on CandidateVerdictVerdict {
  CandidateVerdict toDomain() => switch (this) {
        CandidateVerdictVerdict.undefined0 => CandidateVerdict.fits,
        CandidateVerdictVerdict.undefined1 => CandidateVerdict.partial,
        CandidateVerdictVerdict.undefined2 => CandidateVerdict.doesNotFit,
        CandidateVerdictVerdict.$unknown => CandidateVerdict.partial,
      };
}

extension CandidateVcMapper on CandidateVcVc {
  VerdictColor toDomain() => switch (this) {
        CandidateVcVc.verdictGreen => VerdictColor.green,
        CandidateVcVc.verdictOrange => VerdictColor.orange,
        CandidateVcVc.verdictRed => VerdictColor.red,
        CandidateVcVc.$unknown => VerdictColor.orange,
      };
}

extension CandidateStatusMapper on CandidateStatusStatus {
  CandidateStatus toDomain() => switch (this) {
        CandidateStatusStatus.valueNew => CandidateStatus.newCandidate,
        CandidateStatusStatus.review => CandidateStatus.review,
        CandidateStatusStatus.invited => CandidateStatus.invited,
        CandidateStatusStatus.rejected => CandidateStatus.rejected,
        CandidateStatusStatus.$unknown => CandidateStatus.newCandidate,
      };
}

extension CandidateStatusDomainMapper on CandidateStatus {
  CandidateStatusStatus toDto() => switch (this) {
        CandidateStatus.newCandidate => CandidateStatusStatus.valueNew,
        CandidateStatus.review => CandidateStatusStatus.review,
        CandidateStatus.invited => CandidateStatusStatus.invited,
        CandidateStatus.rejected => CandidateStatusStatus.rejected,
      };
}

extension ConflictDtoMapper on dto.Conflict {
  SyncConflict toDomain() {
    return SyncConflict(
      id: id,
      currentVersion: currentVersion,
      current: current.toDomain(),
    );
  }
}
