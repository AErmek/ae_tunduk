import 'package:cv_scan_ui_kit/src/theme/config/space_padding.dart';
import 'package:cv_scan_ui_kit/src/theme/factory/app_colors_factory.dart';
import 'package:cv_scan_ui_kit/src/theme/factory/app_typography_factory.dart';
import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double lgElevation = 2;
const double mdElevation = 1;
const double smElevation = 0.5;

String fontFamilyGetter(String? fontFamily) => defaultFontFamily;
// (fontFamily?.startsWith('Italiana') ?? false) ? secondaryFontFamily : defaultFontFamily;

const defaultFontFamily = 'Inter';
// const secondaryFontFamily = 'Italiana';
final interStyle = GoogleFonts.getFont(defaultFontFamily, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal);
// final italianaStyle = GoogleFonts.getFont(
//   secondaryFontFamily,
//   fontWeight: FontWeight.w400,
//   fontStyle: FontStyle.normal,
// );

abstract interface class AppThemeBuilder {
  AppColors get colors;
  AppTypography get typography;
  ThemeData get themeData;
  void build();
}

class LightAppThemeBuilder implements AppThemeBuilder {
  @override
  late final AppColors colors;
  @override
  late final AppTypography typography;
  @override
  late final ThemeData themeData;

  @override
  void build() {
    colors = LightAppColorsFactory().create();
    typography = DefaultAppTypographyFactory().create(interStyle);

    themeData = ThemeData(
      useMaterial3: true,
      extensions: {colors, typography},
      // primaryTextTheme: GoogleFonts.montserratTextTheme(),
      fontFamily: interStyle.fontFamily,

      colorScheme: ColorScheme.fromSeed(
        seedColor: colors.primary,
        brightness: Brightness.light,
        outline: colors.divider,
      ),
      iconTheme: IconThemeData(color: colors.onSurfaceMuted),
      scaffoldBackgroundColor: colors.surface,
      appBarTheme: AppBarTheme(
        toolbarHeight: Ui.tokens.appBar.height,
        backgroundColor: colors.surfaceContainer,
        elevation: 0,
        titleTextStyle: typography.bL.r.copyWith(color: colors.onSurface),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colors.surfaceContainer,
        elevation: 0,
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.onSurfaceMuted,
      ),
      dividerColor: colors.divider,
      dividerTheme: DividerThemeData(
        color: colors.divider,
        // thickness: 0.5,
        // space: 0,
        // indent: 0,
        // endIndent: 0,
      ),
      textTheme: TextTheme(
        bodyLarge: typography.bM.r.copyWith(color: colors.onSurface),
        // bodyLarge: TextStyle(color: colors.textPrimary),
        // bodyMedium: TextStyle(color: AppColors.textTextPrimary),
        // bodySmall: TextStyle(color: AppColors.textTextPrimary),
        // displayLarge: TextStyle(color: AppColors.textTextPrimary),
        // displayMedium: TextStyle(color: AppColors.textTextPrimary),
        // displaySmall: TextStyle(color: AppColors.textTextPrimary),
        // headlineLarge: TextStyle(color: AppColors.textTextPrimary),
        // headlineMedium: TextStyle(color: AppColors.textTextPrimary),
        // headlineSmall: TextStyle(color: AppColors.textTextPrimary),
        // labelLarge: TextStyle(color: AppColors.textTextPrimary),
        // labelMedium: TextStyle(color: AppColors.textTextPrimary),
        // labelSmall: TextStyle(color: AppColors.textTextPrimary),
        // titleLarge: TextStyle(color: AppColors.textTextPrimary),
        // titleMedium: TextStyle(color: AppColors.textTextPrimary),
        // titleSmall: TextStyle(color: AppColors.textTextPrimary),
      ),

      popupMenuTheme: PopupMenuThemeData(
        shape: const BeveledRectangleBorder(),
        color: colors.popover,
        iconSize: Ui.tokens.appBar.iconSize,
        iconColor: colors.onSurfaceMuted,
        // textStyle: typography.bM.r.copyWith(color: colors.textPrimary),
        elevation: lgElevation,
        shadowColor: colors.shadow,
        menuPadding: SpacePadding.symmetric(horizontal: const Spacing(3), vertical: const Spacing(2)),
        enableFeedback: false,
        textStyle: typography.bS.r.copyWith(color: colors.onPopover),
        // labelTextStyle: WidgetStateProperty.resolveWith(
        //   (states) => states.contains(WidgetState.selected)
        //       ? typography.bS.m.copyWith(color: colors.onPopover)
        //       : typography.bS.r.copyWith(color: colors.onPopover),
        // ),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: typography.bM.r.copyWith(color: colors.onSurface),

        inputDecorationTheme: InputDecorationTheme(
          contentPadding: Ui.tokens.inputContentPadding,
          constraints: BoxConstraints(minHeight: Ui.tokens.inputHeight),
        ),
        menuStyle: MenuStyle(
          // padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(side: BorderSide(width: 0.5, color: colors.divider))),
          visualDensity: VisualDensity.standard,
          elevation: WidgetStateProperty.all(0),
          backgroundColor: WidgetStateProperty.all(colors.card),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: UnderlineInputBorder(borderSide: BorderSide(color: colors.divider)),
        errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: colors.error)),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: colors.divider)),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: colors.ring)),
        focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: colors.error)),
        labelStyle: typography.bM.r.copyWith(color: colors.onSurfaceMuted),
        errorStyle: typography.bS.r.copyWith(color: colors.error),
        errorMaxLines: 3,
        hintStyle: typography.bM.r.copyWith(color: colors.onSurfaceMuted.opHint),
        suffixIconColor: colors.onSurfaceMuted,
        prefixIconColor: colors.onSurfaceMuted,

        contentPadding: const EdgeInsets.symmetric(vertical: 18.5, horizontal: 16),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: const RoundedRectangleBorder(),
          backgroundColor: colors.primary,
          disabledBackgroundColor: colors.surfaceContainerSoft,
          foregroundColor: colors.onPrimary,
          disabledForegroundColor: colors.onSurfaceMuted,
          textStyle: typography.bL.m,
          padding: const EdgeInsets.all(19),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          // foregroundColor: colors.primary,
          // disabledForegroundColor: colors.onMuted,
          // textStyle: const TextStyle(fontWeight: FontWeight.w600),
          shape: const RoundedRectangleBorder(),
          // overlayColor: colors.accent,

          // backgroundColor: colors.accent,
          disabledBackgroundColor: Colors.transparent,
          // foregroundColor: colors.onPrimary,
          disabledForegroundColor: colors.onSurfaceMuted,
          textStyle: typography.bL.m,
          padding: const EdgeInsets.all(19),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(),
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          side: BorderSide(color: colors.divider, width: 1),
          // visualDensity: const VisualDensity(),
          foregroundColor: colors.onSurface,
          textStyle: typography.bXs.r,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
      actionIconTheme: const ActionIconThemeData(),

      dialogTheme: DialogThemeData(
        shape: const BeveledRectangleBorder(),
        insetPadding: const EdgeInsets.all(16),
        actionsPadding: const EdgeInsets.all(16),
        titleTextStyle: typography.bL.sb.copyWith(color: colors.onSurface),
      ),

      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        titleTextStyle: typography.bM.r.copyWith(color: colors.onSurface),
        minTileHeight: 10,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        shape: const BeveledRectangleBorder(),
        backgroundColor: colors.popover,
        elevation: lgElevation,
        shadowColor: colors.shadow,
        modalBarrierColor: colors.overlay,
      ),
      tabBarTheme: TabBarThemeData(
        dividerHeight: 0,

        tabAlignment: TabAlignment.start,
        labelPadding: const EdgeInsets.only(right: 8, left: 8),
        indicator: BoxDecoration(
          border: Border(bottom: BorderSide(color: colors.divider)),
        ),
        labelStyle: typography.bM.sb,
        unselectedLabelStyle: typography.bM.r,
        labelColor: colors.primary,
        unselectedLabelColor: colors.onSurfaceMuted,
      ),
    );
  }
}
