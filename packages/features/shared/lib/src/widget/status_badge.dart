import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({required this.label, required this.color, this.height, super.key});

  final double? height;
  final Widget label;
  final Color color;

  @override
  Widget build(BuildContext context) => Material(
    color: color.opBadge,
    shape: const StadiumBorder(),
    clipBehavior: Clip.antiAlias,
    child: SizedBox(
      height: height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: height != null ? 0 : 4),
        child: Center(
          widthFactor: 1,
          child: DefaultTextStyle(style: context.theme.style((t) => t.bXs, (c) => color), child: label),
        ),
      ),
    ),
  );
}
