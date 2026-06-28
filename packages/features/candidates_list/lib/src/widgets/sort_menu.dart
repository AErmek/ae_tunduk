import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:feature_candidates_list/src/bloc/candidates_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortMenu extends StatelessWidget {
  const SortMenu({required this.onChanged, super.key});

  final ValueChanged<SortField> onChanged;

  String _label(BuildContext context, SortField field) => switch (field) {
    SortField.name => context.t.candidatesSortByName,
    SortField.experience => context.t.candidatesSortByExperience,
    SortField.dateAdded => context.t.candidatesSortByDateAdded,
  };

  @override
  Widget build(BuildContext context) {
    final selected = context.select<CandidatesListBloc, SortField>((b) => b.state.filter.sort);
    return PopupMenuButton<SortField>(
      icon: const Icon(Icons.sort),
      iconColor: context.themeColors.onPrimaryContainer,
      tooltip: context.t.candidatesSortLabel,
      initialValue: selected,
      onSelected: onChanged,
      itemBuilder: (context) => [
        for (final field in SortField.values)
          PopupMenuItem<SortField>(
            value: field,
            child: Row(
              children: [
                Icon(field == selected ? Icons.check : null, size: 18, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 12),
                Text(_label(context, field)),
              ],
            ),
          ),
      ],
    );
  }
}
