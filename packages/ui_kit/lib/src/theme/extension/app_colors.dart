import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
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

  @override
  AppColors copyWith({
    Color? paper,
    Color? surface,
    Color? surfaceElevated,
    Color? surfaceContainer,
    Color? surfaceContainerSoft,
    Color? card,
    Color? divider,
    Color? onSurface,
    Color? onSurfaceVariant,
    Color? onSurfaceMuted,
    Color? primary,
    Color? primarySoft,
    Color? primaryDeep,
    Color? primaryContainer,
    Color? onPrimary,
    Color? onPrimaryContainer,
    Color? onCard,
    Color? popover,
    Color? onPopover,
    Color? error,
    Color? onError,
    Color? success,
    Color? onSuccess,
    Color? warning,
    Color? onWarning,
    Color? shadow,
    Color? overlay,
    Color? ring,
    Color? input,
  }) {
    return AppColors(
      paper: paper ?? this.paper,
      surface: surface ?? this.surface,
      surfaceElevated: surfaceElevated ?? this.surfaceElevated,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      surfaceContainerSoft: surfaceContainerSoft ?? this.surfaceContainerSoft,
      card: card ?? this.card,
      divider: divider ?? this.divider,
      onSurface: onSurface ?? this.onSurface,
      onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
      onSurfaceMuted: onSurfaceMuted ?? this.onSurfaceMuted,
      primary: primary ?? this.primary,
      primarySoft: primarySoft ?? this.primarySoft,
      primaryDeep: primaryDeep ?? this.primaryDeep,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimary: onPrimary ?? this.onPrimary,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      onCard: onCard ?? this.onCard,
      popover: popover ?? this.popover,
      onPopover: onPopover ?? this.onPopover,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      shadow: shadow ?? this.shadow,
      overlay: overlay ?? this.overlay,
      ring: ring ?? this.ring,
      input: input ?? this.input,
    );
  }

  @override
  AppColors lerp(covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      paper: Color.lerp(paper, other.paper, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceElevated: Color.lerp(surfaceElevated, other.surfaceElevated, t)!,
      surfaceContainer: Color.lerp(surfaceContainer, other.surfaceContainer, t)!,
      surfaceContainerSoft: Color.lerp(surfaceContainerSoft, other.surfaceContainerSoft, t)!,
      card: Color.lerp(card, other.card, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      onSurfaceVariant: Color.lerp(onSurfaceVariant, other.onSurfaceVariant, t)!,
      onSurfaceMuted: Color.lerp(onSurfaceMuted, other.onSurfaceMuted, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      primarySoft: Color.lerp(primarySoft, other.primarySoft, t)!,
      primaryDeep: Color.lerp(primaryDeep, other.primaryDeep, t)!,
      primaryContainer: Color.lerp(primaryContainer, other.primaryContainer, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      onPrimaryContainer: Color.lerp(onPrimaryContainer, other.onPrimaryContainer, t)!,
      onCard: Color.lerp(onCard, other.onCard, t)!,
      popover: Color.lerp(popover, other.popover, t)!,
      onPopover: Color.lerp(onPopover, other.onPopover, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      overlay: Color.lerp(overlay, other.overlay, t)!,
      ring: Color.lerp(ring, other.ring, t)!,
      input: Color.lerp(input, other.input, t)!,
    );
  }
}
