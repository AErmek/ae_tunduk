import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:feature_candidates_list/src/bloc/candidates_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerdictFilter extends StatelessWidget {
  const VerdictFilter({required this.onChanged, super.key});

  final ValueChanged<CandidateVerdict?> onChanged;

  @override
  Widget build(BuildContext context) {
    final selected = context.select<CandidatesListBloc, CandidateVerdict?>((b) => b.state.filter.verdict);
    return SizedBox(
      height: 48,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          for (final verdict in CandidateVerdict.values)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: FilterChip(
                label: Text(verdict.apiKey),
                selected: selected == verdict,
                onSelected: (on) => onChanged(on ? verdict : null),
              ),
            ),
        ],
      ),
    );
  }
}
