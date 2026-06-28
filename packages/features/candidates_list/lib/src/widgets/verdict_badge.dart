import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class CandidateVerdictBadge extends StatelessWidget {
  const CandidateVerdictBadge({required this.verdict, required this.tone, super.key});

  final CandidateVerdict verdict;
  final CandidateVerdictTone tone;

  @override
  Widget build(BuildContext context) {
    final color = tone.getColor(context.themeColors);
    final label = context.t.verdictDisplayName(verdict.name);
    return StatusBadge(label: Text(label), color: color);
  }
}
