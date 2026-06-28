import 'dart:ui';

import 'package:cv_scan_ui_kit/src/theme/extension/app_colors.dart';

abstract interface class AppColorsFactory {
  AppColors create();
}

class LightAppColorsFactory implements AppColorsFactory {
  @override
  AppColors create() => const AppColors(
    paper: Color(0xFFE6E1D3),
    surface: Color(0xFFF6F3EC),
    surfaceElevated: Color(0xFFFCFAF4),
    surfaceContainer: Color(0xFFEDE8DC),
    surfaceContainerSoft: Color(0xFFE6EDE7),
    card: Color(0xFFFFFFFF),
    divider: Color(0xFFDDD7C9),
    onSurface: Color(0xFF1A2522),
    onSurfaceVariant: Color(0xFF62706C),
    onSurfaceMuted: Color(0xFF8A968F),
    primary: Color(0xFF0B6E5C),
    primarySoft: Color(0xFF2E8C78),
    primaryDeep: Color(0xFF064A3D),
    primaryContainer: Color(0xFFDBEAE3),
    onPrimary: Color(0xFFFFFFFF),
    onPrimaryContainer: Color(0xFF093D31),

    onCard: Color(0xFF1A2522),
    popover: Color(0xFFFCFAF4),
    onPopover: Color(0xFF1A2522),
    error: Color(0xFFB4452F),
    onError: Color(0xFFFFFFFF),
    success: Color(0xFF2E8C78),
    onSuccess: Color(0xFFFFFFFF),
    warning: Color(0xFFC4793F),
    onWarning: Color(0xFFFFFFFF),

    shadow: Color(0x1F1A2522),
    overlay: Color(0x661A2522),
    ring: Color(0xFF0B6E5C),
    input: Color(0xFFDDD7C9),
  );
}
