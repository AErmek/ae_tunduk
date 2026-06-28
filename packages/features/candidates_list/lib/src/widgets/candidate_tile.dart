import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:feature_candidates_list/src/widgets/status_badge.dart';
import 'package:feature_candidates_list/src/widgets/verdict_badge.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class CandidateTile extends StatelessWidget {
  const CandidateTile({required this.candidate, required this.onTap, super.key});

  final CandidateLight candidate;
  final VoidCallback onTap;

  static const double height = 120;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tone = candidate.verdictTone.getColor(context.themeColors);

    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: tone.opBadge,
                child: Text(candidate.name.extractInitials(), style: theme.style((t) => t.bM.b, (c) => tone)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      candidate.name,
                      style: theme.style((t) => t.bM.sb, (c) => c.onCard),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      candidate.posLabel,
                      style: theme.style((t) => t.bXs.r, (c) => c.onSurfaceVariant),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Flexible(
                      child: Wrap(
                        spacing: 6,
                        runSpacing: 4,
                        children: [
                          CandidateVerdictBadge(verdict: candidate.verdict, tone: candidate.verdictTone),
                          CandidateStatusBadge(status: candidate.status),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.chevron_right, color: theme.colors.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}
