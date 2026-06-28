import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class CandidateStatusBadge extends StatelessWidget {
  const CandidateStatusBadge({required this.status, super.key});

  final CandidateStatus status;

  @override
  Widget build(BuildContext context) {
    final color = status.getColor(context.themeColors);
    final label = context.t.candidateStatusDisplayName(status.name);
    return StatusBadge(label: Text(label), color: color);
  }
}
