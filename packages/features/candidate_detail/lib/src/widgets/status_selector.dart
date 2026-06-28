import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

/// Changes a candidate's status. The selection updates optimistically.
class StatusSelector extends StatelessWidget {
  const StatusSelector({required this.status, required this.onChanged, this.enabled = true, super.key});

  final CandidateStatus status;
  final ValueChanged<CandidateStatus> onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) => Wrap(
    spacing: 8,
    runSpacing: 8,
    children: CandidateStatus.values
        .map(
          (s) => CustomChip(
            label: Text(context.t.candidateStatusDisplayName(s.name)),
            selected: s == status,
            onSelected: enabled ? (_) => onChanged(s) : null,
          ),
        )
        .toList(),
  );
}
