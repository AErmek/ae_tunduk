import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

const _size = Size(18, 3);

class NavigationSelectedIndicator extends StatelessWidget {
  const NavigationSelectedIndicator({required this.isSelected, super.key});

  final bool isSelected;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: _size.width,
    height: _size.height,
    child: TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: isSelected ? 0 : 1, end: isSelected ? 1 : 0),
      duration: Durations.medium1,
      curve: Curves.easeInOut,
      builder: (context, scaleX, child) => Transform.scale(
        scaleX: scaleX,
        scaleY: 1, // ← height stays fixed
        alignment: Alignment.center,
        child: child,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.theme.colors.primary,
          borderRadius: BorderRadius.circular(Ui.tokens.radius.full),
        ),
        child: const SizedBox.expand(),
      ),
    ),
  );
}
