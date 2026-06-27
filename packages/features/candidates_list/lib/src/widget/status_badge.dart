import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({required this.status, super.key});

  final CandidateStatus status;

  // TODO: localize labels once status keys are added to the ARB.
  (String, Color) _style() => switch (status) {
    CandidateStatus.newCandidate => ('Новый', Colors.blueGrey),
    CandidateStatus.review => ('На рассмотрении', Colors.orange),
    CandidateStatus.invited => ('Приглашён', Colors.green),
    CandidateStatus.rejected => ('Отклонён', Colors.red),
  };

  @override
  Widget build(BuildContext context) {
    final (label, color) = _style();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(color: color.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(8)),
      child: Text(label, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w500)),
    );
  }
}
