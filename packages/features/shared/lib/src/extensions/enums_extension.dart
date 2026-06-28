import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

extension CandidateVerdictToneX on CandidateVerdictTone {
  Color getColor(AppColors color) => switch (this) {
    CandidateVerdictTone.green => color.success,
    CandidateVerdictTone.orange => color.warning,
    CandidateVerdictTone.red => color.error,
  };
}

extension CandidateStatusX on CandidateStatus {
  Color getColor(AppColors color) => switch (this) {
    CandidateStatus.newCandidate => Colors.blueGrey,
    CandidateStatus.review => color.warning,
    CandidateStatus.invited => color.success,
    CandidateStatus.rejected => color.error,
  };
}
