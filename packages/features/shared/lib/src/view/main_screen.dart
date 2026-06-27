import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/src/widget/main/main_navigation_bar.dart';
import 'package:shared/src/widget/main/main_navigation_bar_item.dart';

final _items = <MainNavigationBarItemParam>[
  MainNavigationBarItemParam(icon: AppIcons.candidates, label: (s) => s.navCandidates),
  MainNavigationBarItemParam(icon: AppIcons.settings, label: (s) => s.navSettings),
];

class MainScreen extends StatefulWidget {
  const MainScreen({required this.navigationShell, super.key});
  final StatefulNavigationShell navigationShell;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: widget.navigationShell,
    backgroundColor: context.themeColors.surface,
    extendBody: true,
    bottomNavigationBar: SafeArea(
      top: false,
      child: MainNavigationBar(
        items: _items,
        index: widget.navigationShell.currentIndex,
        onTap: (index) {
          widget.navigationShell.goBranch(index, initialLocation: index == widget.navigationShell.currentIndex);
        },
      ),
    ),
  );
}
