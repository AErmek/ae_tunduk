import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_colors.tailor.dart';

@TailorMixin(themeGetter: ThemeGetter.none)
class AppColors extends ThemeExtension<AppColors> with _$AppColorsTailorMixin {
  const AppColors({
    required this.paper,
    required this.surface,
    required this.surfaceElevated,
    required this.surfaceContainer,
    required this.surfaceContainerSoft,
    required this.card,
    required this.divider,
    required this.onSurface,
    required this.onSurfaceVariant,
    required this.onSurfaceMuted,
    required this.primary,
    required this.primarySoft,
    required this.primaryDeep,
    required this.primaryContainer,
    required this.onPrimary,
    required this.onPrimaryContainer,
    required this.onCard,
    required this.popover,
    required this.onPopover,
    required this.error,
    required this.onError,
    required this.success,
    required this.onSuccess,
    required this.warning,
    required this.onWarning,
    required this.shadow,
    required this.overlay,
    required this.ring,
    required this.input,
  });

  @override
  final Color paper;

  @override
  final Color surface, surfaceElevated, surfaceContainer, surfaceContainerSoft;

  @override
  final Color card, divider;

  @override
  final Color onSurface, onSurfaceVariant, onSurfaceMuted;

  @override
  final Color primary, primarySoft, primaryDeep, primaryContainer;

  @override
  final Color onPrimary, onPrimaryContainer;

  @override
  final Color onCard, popover, onPopover;

  @override
  final Color error, onError;

  @override
  final Color success, onSuccess, warning, onWarning;

  @override
  final Color shadow, overlay, ring, input;
}
