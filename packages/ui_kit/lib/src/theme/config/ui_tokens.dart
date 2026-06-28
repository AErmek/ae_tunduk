import 'package:cv_scan_ui_kit/src/theme/config/radius_tokens.dart';
import 'package:cv_scan_ui_kit/src/theme/config/spacing.dart';
import 'package:flutter/material.dart';

final class Ui {
  Ui._();

  static final Ui _instance = Ui._();

  static Ui get tokens => _instance;

  final double popupMenuItemHeight = 48;

  /// App bar

  // final double appBarHeight = 72.0;
  // //

  // final double appBarMediumHeight = 40 + 24.0;
  // //

  // final double appBarMaxHeight = 52 + 24.0;
  // //
  // final double appBarBottomHeight = 52;
  // double get appBarWithBottomHeight => appBarHeight + appBarBottomHeight;
  // final EdgeInsets appBarPadding = EdgeInsets.symmetric(horizontal: const Spacing(5).value);

  /// Input
  final double inputIconSize = 16;
  final double inputHeight = 56;
  final EdgeInsets inputContentPadding = const EdgeInsets.symmetric(vertical: 18.5, horizontal: 16);

  ///Icon
  ///
  final double lgIconsSize = 36;
  final double defaultIconSize = 24;
  final double mdIconSize = 20;
  final double smIconSize = 12;
  final double xsIconSize = 8;

  RadiusTokens get radius => RadiusTokens.i;
  NavigationBarTokens get navigationBar => NavigationBarTokens.i;
  AppBarTokens get appBar => AppBarTokens.i;
}

final class AppBarTokens {
  AppBarTokens._();

  static final AppBarTokens _instance = AppBarTokens._();

  static AppBarTokens get i => _instance;

  final double logoSize = 52;
  final double iconSize = 24;
  final double iconButtonSize = 48;
  final double height = 61;
  final EdgeInsets padding = EdgeInsets.symmetric(horizontal: const Spacing(5).value);
}

final class NavigationBarTokens {
  NavigationBarTokens._();

  static final NavigationBarTokens _instance = NavigationBarTokens._();

  static NavigationBarTokens get i => _instance;

  final double height = 69;
  final double iconSize = 26;
  final Size navigationBarItemSize = const Size(56, 44);
  final double iconSplashSize = 48;
}
