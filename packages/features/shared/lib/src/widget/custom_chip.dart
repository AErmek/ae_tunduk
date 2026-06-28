import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({required this.label, this.onSelected, this.selected, this.height, super.key});

  final ValueChanged<bool>? onSelected;
  final bool? selected;
  final double? height;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    final colors = context.themeColors;
    final isSelected = selected ?? false;

    return Material(
      color: isSelected ? colors.primaryContainer : colors.surfaceContainer,
      shape: const StadiumBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onSelected == null ? null : () => onSelected!(!isSelected),
        child: SizedBox(
          height: height,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: height != null ? 0 : 8),
            child: Center(
              widthFactor: 1,
              child: DefaultTextStyle(
                style: context.theme.style((t) => t.bS, (c) => isSelected ? c.onPrimaryContainer : c.onSurfaceVariant),
                child: label,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
