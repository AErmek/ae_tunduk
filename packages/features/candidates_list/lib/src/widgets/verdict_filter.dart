import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:feature_candidates_list/src/bloc/candidates_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

class VerdictFilter extends StatelessWidget {
  const VerdictFilter({required this.onChanged, super.key, this.padding});

  static const double height = 36;

  final EdgeInsetsGeometry? padding;

  final ValueChanged<CandidateVerdict?> onChanged;

  @override
  Widget build(BuildContext context) {
    final selected = context.select<CandidatesListBloc, CandidateVerdict?>((b) => b.state.filter.verdict);

    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: padding,
        itemCount: CandidateVerdict.values.length,
        separatorBuilder: (_, _) => const Space.h(Spacing(2)),
        itemBuilder: (context, index) {
          final verdict = CandidateVerdict.values[index];
          final isSelected = selected == verdict;
          return CustomChip(
            label: Text(context.t.verdictDisplayName(verdict.name)),
            height: height,

            selected: isSelected,
            onSelected: (on) => onChanged(on ? verdict : null),
          );
        },
      ),
    );
  }
}
