// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_colors.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AppColorsTailorMixin on ThemeExtension<AppColors> {
  Color get paper;
  Color get surface;
  Color get surfaceElevated;
  Color get surfaceContainer;
  Color get surfaceContainerSoft;
  Color get card;
  Color get divider;
  Color get onSurface;
  Color get onSurfaceVariant;
  Color get onSurfaceMuted;
  Color get primary;
  Color get primarySoft;
  Color get primaryDeep;
  Color get primaryContainer;
  Color get onPrimary;
  Color get onPrimaryContainer;
  Color get onCard;
  Color get popover;
  Color get onPopover;
  Color get error;
  Color get onError;
  Color get success;
  Color get onSuccess;
  Color get warning;
  Color get onWarning;
  Color get shadow;
  Color get overlay;
  Color get ring;
  Color get input;

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
    if (other is! AppColors) return this as AppColors;
    return AppColors(
      paper: Color.lerp(paper, other.paper, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceElevated: Color.lerp(surfaceElevated, other.surfaceElevated, t)!,
      surfaceContainer: Color.lerp(
        surfaceContainer,
        other.surfaceContainer,
        t,
      )!,
      surfaceContainerSoft: Color.lerp(
        surfaceContainerSoft,
        other.surfaceContainerSoft,
        t,
      )!,
      card: Color.lerp(card, other.card, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      onSurfaceVariant: Color.lerp(
        onSurfaceVariant,
        other.onSurfaceVariant,
        t,
      )!,
      onSurfaceMuted: Color.lerp(onSurfaceMuted, other.onSurfaceMuted, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      primarySoft: Color.lerp(primarySoft, other.primarySoft, t)!,
      primaryDeep: Color.lerp(primaryDeep, other.primaryDeep, t)!,
      primaryContainer: Color.lerp(
        primaryContainer,
        other.primaryContainer,
        t,
      )!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      onPrimaryContainer: Color.lerp(
        onPrimaryContainer,
        other.onPrimaryContainer,
        t,
      )!,
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

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppColors &&
            const DeepCollectionEquality().equals(paper, other.paper) &&
            const DeepCollectionEquality().equals(surface, other.surface) &&
            const DeepCollectionEquality().equals(
              surfaceElevated,
              other.surfaceElevated,
            ) &&
            const DeepCollectionEquality().equals(
              surfaceContainer,
              other.surfaceContainer,
            ) &&
            const DeepCollectionEquality().equals(
              surfaceContainerSoft,
              other.surfaceContainerSoft,
            ) &&
            const DeepCollectionEquality().equals(card, other.card) &&
            const DeepCollectionEquality().equals(divider, other.divider) &&
            const DeepCollectionEquality().equals(onSurface, other.onSurface) &&
            const DeepCollectionEquality().equals(
              onSurfaceVariant,
              other.onSurfaceVariant,
            ) &&
            const DeepCollectionEquality().equals(
              onSurfaceMuted,
              other.onSurfaceMuted,
            ) &&
            const DeepCollectionEquality().equals(primary, other.primary) &&
            const DeepCollectionEquality().equals(
              primarySoft,
              other.primarySoft,
            ) &&
            const DeepCollectionEquality().equals(
              primaryDeep,
              other.primaryDeep,
            ) &&
            const DeepCollectionEquality().equals(
              primaryContainer,
              other.primaryContainer,
            ) &&
            const DeepCollectionEquality().equals(onPrimary, other.onPrimary) &&
            const DeepCollectionEquality().equals(
              onPrimaryContainer,
              other.onPrimaryContainer,
            ) &&
            const DeepCollectionEquality().equals(onCard, other.onCard) &&
            const DeepCollectionEquality().equals(popover, other.popover) &&
            const DeepCollectionEquality().equals(onPopover, other.onPopover) &&
            const DeepCollectionEquality().equals(error, other.error) &&
            const DeepCollectionEquality().equals(onError, other.onError) &&
            const DeepCollectionEquality().equals(success, other.success) &&
            const DeepCollectionEquality().equals(onSuccess, other.onSuccess) &&
            const DeepCollectionEquality().equals(warning, other.warning) &&
            const DeepCollectionEquality().equals(onWarning, other.onWarning) &&
            const DeepCollectionEquality().equals(shadow, other.shadow) &&
            const DeepCollectionEquality().equals(overlay, other.overlay) &&
            const DeepCollectionEquality().equals(ring, other.ring) &&
            const DeepCollectionEquality().equals(input, other.input));
  }

  @override
  int get hashCode {
    return Object.hashAll([
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(paper),
      const DeepCollectionEquality().hash(surface),
      const DeepCollectionEquality().hash(surfaceElevated),
      const DeepCollectionEquality().hash(surfaceContainer),
      const DeepCollectionEquality().hash(surfaceContainerSoft),
      const DeepCollectionEquality().hash(card),
      const DeepCollectionEquality().hash(divider),
      const DeepCollectionEquality().hash(onSurface),
      const DeepCollectionEquality().hash(onSurfaceVariant),
      const DeepCollectionEquality().hash(onSurfaceMuted),
      const DeepCollectionEquality().hash(primary),
      const DeepCollectionEquality().hash(primarySoft),
      const DeepCollectionEquality().hash(primaryDeep),
      const DeepCollectionEquality().hash(primaryContainer),
      const DeepCollectionEquality().hash(onPrimary),
      const DeepCollectionEquality().hash(onPrimaryContainer),
      const DeepCollectionEquality().hash(onCard),
      const DeepCollectionEquality().hash(popover),
      const DeepCollectionEquality().hash(onPopover),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(onError),
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(onSuccess),
      const DeepCollectionEquality().hash(warning),
      const DeepCollectionEquality().hash(onWarning),
      const DeepCollectionEquality().hash(shadow),
      const DeepCollectionEquality().hash(overlay),
      const DeepCollectionEquality().hash(ring),
      const DeepCollectionEquality().hash(input),
    ]);
  }
}
