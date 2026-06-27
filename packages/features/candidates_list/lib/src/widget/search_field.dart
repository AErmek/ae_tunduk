import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({required this.onChanged, super.key});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
    child: TextField(
      onChanged: onChanged,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: 'Поиск по имени или позиции',
        border: OutlineInputBorder(),
        isDense: true,
      ),
    ),
  );
}
