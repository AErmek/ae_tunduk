import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({required this.onChanged, super.key});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
    child: TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: context.t.candidatesSearchHint,
        border: const OutlineInputBorder(),
        isDense: true,
      ),
    ),
  );
}
