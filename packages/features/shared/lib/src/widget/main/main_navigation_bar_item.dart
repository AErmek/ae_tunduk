import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:shared/src/widget/main/navigation_selected_indicator.dart';

class MainNavigationBarItemParam {
  const MainNavigationBarItemParam({required this.icon, required this.label, this.tooltip});
  final IconData icon;
  final String Function(S t) label;
  final String? tooltip;
}

class MainNavigationBarItem extends StatelessWidget {
  const MainNavigationBarItem({required this.param, required this.isSelected, this.onTap, super.key});
  final MainNavigationBarItemParam param;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(Ui.tokens.radius.lg),
    child: SizedBox(
      width: Ui.tokens.navigationBar.navigationBarItemSize.width,
      height: Ui.tokens.navigationBar.navigationBarItemSize.height,
      child: Column(
        key: ValueKey(isSelected),
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedSwitcher(
            duration: Durations.medium1,
            child: Icon(
              param.icon,
              size: Ui.tokens.navigationBar.iconSize,
              color: isSelected ? context.themeColors.primary : context.themeColors.onSurfaceMuted,
            ),
          ),
          const Space.v(Spacing(1.25)),
          NavigationSelectedIndicator(isSelected: isSelected),
          // Flexible(
          //   child: Text(
          //     param.label(context.t),
          //     textAlign: TextAlign.center,
          //     style: context.theme.style(
          //       (t) => isSelected ? t.xsHigh.r : t.xsHigh.m,
          //       (c) => isSelected ? c.colorLink : c.inactiveGreen,
          //     ),
          //     overflow: TextOverflow.ellipsis,
          //     maxLines: 1,
          //   ),
          // ),
        ],
      ),
    ),
  );
}
