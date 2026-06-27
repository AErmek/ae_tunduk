import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:feature_candidates_list/src/widget/verdict_badge.dart';
import 'package:flutter/material.dart';

class CandidateTile extends StatelessWidget {
  const CandidateTile({required this.candidate, required this.onTap, super.key});

  final CandidateLight candidate;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => ListTile(
    onTap: onTap,
    title: Text(candidate.name),
    subtitle: Text(candidate.posLabel),

    trailing: VerdictBadge(verdict: candidate.verdict, tone: candidate.verdictTone),
  );
}
