import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_typography.tailor.dart';

@TailorMixin(themeGetter: ThemeGetter.none)
class AppTypography extends ThemeExtension<AppTypography> with _$AppTypographyTailorMixin {
  const AppTypography({
    required this.h0,
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.bXl,
    required this.bL,
    required this.bM,
    required this.bS,
    required this.bXs,
    required this.bXXs,
    required this.caption,
  });

  @override
  final TextStyle h0, h1, h2, h3, h4, bXl, bL, bM, bS, bXs, bXXs, caption;
}
