import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({required this.loading, required this.hasMore, super.key});

  final bool loading;
  final bool hasMore;

  static const double height = _height + 8;

  static const double _height = 24;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(
        child: SizedBox(width: BottomLoader._height, height: BottomLoader._height, child: CircularProgressIndicator()),
      );
    }
    if (!hasMore) {
      return Center(child: Text(context.t.candidatesListNoMoreCandidates));
    }
    return const SizedBox(height: BottomLoader.height);
  }
}
