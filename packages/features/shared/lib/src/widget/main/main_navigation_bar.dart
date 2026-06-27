import 'package:collection/collection.dart';
import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:shared/src/widget/main/main_navigation_bar_item.dart';

class MainNavigationBar extends StatefulWidget implements PreferredSizeWidget {
  const MainNavigationBar({required this.index, required this.onTap, required this.items, super.key});

  final int index;
  final void Function(int index) onTap;
  final List<MainNavigationBarItemParam> items;

  @override
  State<MainNavigationBar> createState() => _MainNavigationBarState();

  @override
  Size get preferredSize => Size.fromHeight(Ui.tokens.navigationBar.height);
}

class _MainNavigationBarState extends State<MainNavigationBar> {
  late ThemeData theme;
  late double height;

  @override
  void didChangeDependencies() {
    theme = context.theme;
    _calculateHeight();
    super.didChangeDependencies();
  }

  void _calculateHeight() {
    height = _calculateMainNavigationBarHeight(context);
  }

  @override
  Widget build(BuildContext context) => PreferredSize(
    preferredSize: Size.fromHeight(height),
    child: Container(
      height: height,
      decoration: BoxDecoration(
        color: theme.colors.surface,
        border: Border(top: BorderSide(color: theme.colors.divider, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        spacing: Spacing(2).value,
        children: widget.items
            .mapIndexed(
              (i, e) => Flexible(
                child: Material(
                  color: Colors.transparent,
                  child: Tooltip(
                    message: e.tooltip ?? e.label(context.t),
                    child: MainNavigationBarItem(param: e, isSelected: widget.index == i, onTap: () => widget.onTap(i)),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    ),
  );
}

class MainNavigationBarSpace extends StatelessWidget {
  const MainNavigationBarSpace({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(height: _calculateMainNavigationBarHeight(context));
}

double _calculateMainNavigationBarHeight(BuildContext context) => Ui.tokens.navigationBar.height;
