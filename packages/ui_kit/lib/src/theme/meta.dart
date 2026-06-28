import 'package:cv_scan_ui_kit/src/theme/extension/app_colors.dart';
import 'package:cv_scan_ui_kit/src/theme/extension/app_typography.dart';
import 'package:cv_scan_ui_kit/src/theme/factory/app_theme_builder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightAppThemeBuilder = LightAppThemeBuilder()..build();
final darkAppThemeBuilder = lightAppThemeBuilder; //TODO change if needed

extension ThemeDataX on ThemeData {
  AppColors get colors => extension<AppColors>() ?? lightAppThemeBuilder.colors;

  AppTypography get styles => extension<AppTypography>() ?? lightAppThemeBuilder.typography;

  TextStyle style(TextStyle Function(AppTypography t) styleGetter, Color Function(AppColors c) colorGetter) =>
      styleGetter(styles).c(colorGetter(colors));
}

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  AppColors get themeColors => theme.colors;
  AppTypography get themeStyles => theme.styles;
}

extension TextStyleX on TextStyle {
  TextStyle c(Color color) => copyWith(color: color);

  TextStyle get l => copyWithFontWeight(fontWeight: FontWeight.w300);

  TextStyle get r => copyWithFontWeight(fontWeight: FontWeight.w400);

  TextStyle get m => copyWithFontWeight(fontWeight: FontWeight.w500);

  TextStyle get sb => copyWithFontWeight(fontWeight: FontWeight.w600);

  TextStyle get b => copyWithFontWeight(fontWeight: FontWeight.w700);

  TextStyle get i => copyWith(fontStyle: FontStyle.italic);

  TextStyle uLine({Color? color, double? thickness}) => copyWith(
    decoration: TextDecoration.underline,
    decorationColor: color,
    decorationStyle: TextDecorationStyle.solid,
    decorationThickness: thickness,
  );

  //Use this to set the font weight of the text style google fonts
  TextStyle copyWithFontWeight({FontWeight? fontWeight}) =>
      GoogleFonts.getFont(fontFamilyGetter(fontFamily), textStyle: this, fontWeight: fontWeight);
}

extension ColorX on Color {
  Color op(double opacity) => withValues(alpha: opacity);

  Color get opBadge => op(0.1);

  Color get opScaffold => op(0.4);

  Color get opHint => op(0.5);
}

double get terminatedOpacity => 0.7;
double get fullOpacity => 1;
