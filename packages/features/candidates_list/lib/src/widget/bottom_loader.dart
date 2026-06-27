import 'package:flutter/material.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({required this.loading, required this.hasMore, super.key});

  final bool loading;
  final bool hasMore;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    if (!hasMore) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: Text('Это все кандидаты')),
      );
    }
    return const SizedBox(height: 24);
  }
}
