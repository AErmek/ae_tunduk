import 'package:cv_scan_ui_kit/src/theme/extension/app_typography.dart';
import 'package:flutter/material.dart';

abstract interface class AppTypographyFactory {
  AppTypography create(TextStyle defaultStyle, [TextStyle? secondaryStyle]);
}

class DefaultAppTypographyFactory implements AppTypographyFactory {
  @override
  AppTypography create(TextStyle defaultStyle, [TextStyle? secondaryStyle]) => AppTypography(
    h0: defaultStyle.copyWith(fontSize: 52, height: 1),
    h1: defaultStyle.copyWith(fontSize: 40, height: 1),
    h2: defaultStyle.copyWith(fontSize: 32, height: 1),
    h3: defaultStyle.copyWith(fontSize: 28, height: 1),
    h4: defaultStyle.copyWith(fontSize: 24, height: 1),
    bXl: defaultStyle.copyWith(fontSize: 20, height: 1),
    bL: defaultStyle.copyWith(fontSize: 18, height: 1),
    bM: defaultStyle.copyWith(fontSize: 16, height: 1.2),
    bS: defaultStyle.copyWith(fontSize: 14, height: 1),
    bXs: defaultStyle.copyWith(fontSize: 12, height: 1),
    bXXs: defaultStyle.copyWith(fontSize: 10, height: 1, letterSpacing: 0.5),
    caption: defaultStyle.copyWith(fontSize: 8, height: 1, letterSpacing: 0.5),
  );
}
