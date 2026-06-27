import 'package:cv_scan_domain/src/entities/candidate.dart';
import 'package:cv_scan_domain/src/enums/candidate_status.dart';
import 'package:cv_scan_domain/src/enums/candidate_verdict.dart';
import 'package:cv_scan_domain/src/enums/candidate_verdict_tone.dart';
import 'package:equatable/equatable.dart';

/// Lightweight projection for the list — only what a row renders. Skips the
/// heavy JSON fields (exp, criteria, questions, …) the full [Candidate] carries.
class CandidateLight extends Equatable {
  const CandidateLight({
    required this.id,
    required this.name,
    required this.posLabel,
    required this.verdict,
    required this.verdictTone,
    required this.status,
    required this.version,
  });

  final String id;
  final String name;
  final String posLabel;
  final CandidateVerdict verdict;
  final CandidateVerdictTone verdictTone;
  final CandidateStatus status;
  final int version;

  @override
  List<Object?> get props => [id, name, posLabel, verdict, verdictTone, status, version];
}

extension CandidateToLight on Candidate {
  CandidateLight toLight() => CandidateLight(
    id: id,
    name: name,
    posLabel: posLabel,
    verdict: verdict,
    verdictTone: verdictTone,
    status: status,
    version: version,
  );
}
