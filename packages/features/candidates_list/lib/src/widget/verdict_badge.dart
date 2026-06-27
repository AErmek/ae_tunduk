import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class VerdictBadge extends StatelessWidget {
  const VerdictBadge({required this.verdict, required this.tone, super.key});

  final CandidateVerdict verdict;
  final CandidateVerdictTone tone;

  Color _color(BuildContext context) {
    final colors = context.themeColors;

    return switch (tone) {
      CandidateVerdictTone.green => colors.success,
      CandidateVerdictTone.orange => colors.warning,
      CandidateVerdictTone.red => colors.error,
    };
  }

  @override
  Widget build(BuildContext context) {
    final color = _color(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: color.opBadge, borderRadius: BorderRadius.circular(12)),
      child: Text(
        verdict.apiKey,
        style: TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 12),
      ),
    );
  }
}
