import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:feature_candidates_list/src/widgets/status_badge.dart';
import 'package:feature_candidates_list/src/widgets/verdict_badge.dart';
import 'package:flutter/material.dart';

class CandidateTile extends StatelessWidget {
  const CandidateTile({required this.candidate, required this.onTap, super.key});

  final CandidateLight candidate;
  final VoidCallback onTap;

  static const double height = 120;

  Color _toneColor() => switch (candidate.verdictTone) {
    CandidateVerdictTone.green => Colors.green,
    CandidateVerdictTone.orange => Colors.orange,
    CandidateVerdictTone.red => Colors.red,
  };

  String get _initials {
    final parts = candidate.name.trim().split(RegExp(r'\s+'));
    return parts.take(2).map((p) => p.isEmpty ? '' : p[0]).join().toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tone = _toneColor();

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
                backgroundColor: tone.withValues(alpha: 0.15),
                child: Text(
                  _initials,
                  style: theme.textTheme.titleMedium?.copyWith(color: tone, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      candidate.name,
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      candidate.posLabel,
                      style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      children: [
                        VerdictBadge(verdict: candidate.verdict, tone: candidate.verdictTone),
                        StatusBadge(status: candidate.status),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.chevron_right, color: theme.colorScheme.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}
