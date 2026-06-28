// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_typography.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AppTypographyTailorMixin on ThemeExtension<AppTypography> {
  TextStyle get h0;
  TextStyle get h1;
  TextStyle get h2;
  TextStyle get h3;
  TextStyle get h4;
  TextStyle get bXl;
  TextStyle get bL;
  TextStyle get bM;
  TextStyle get bS;
  TextStyle get bXs;
  TextStyle get bXXs;
  TextStyle get caption;

  @override
  AppTypography copyWith({
    TextStyle? h0,
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? h3,
    TextStyle? h4,
    TextStyle? bXl,
    TextStyle? bL,
    TextStyle? bM,
    TextStyle? bS,
    TextStyle? bXs,
    TextStyle? bXXs,
    TextStyle? caption,
  }) {
    return AppTypography(
      h0: h0 ?? this.h0,
      h1: h1 ?? this.h1,
      h2: h2 ?? this.h2,
      h3: h3 ?? this.h3,
      h4: h4 ?? this.h4,
      bXl: bXl ?? this.bXl,
      bL: bL ?? this.bL,
      bM: bM ?? this.bM,
      bS: bS ?? this.bS,
      bXs: bXs ?? this.bXs,
      bXXs: bXXs ?? this.bXXs,
      caption: caption ?? this.caption,
    );
  }

  @override
  AppTypography lerp(covariant ThemeExtension<AppTypography>? other, double t) {
    if (other is! AppTypography) return this as AppTypography;
    return AppTypography(
      h0: TextStyle.lerp(h0, other.h0, t)!,
      h1: TextStyle.lerp(h1, other.h1, t)!,
      h2: TextStyle.lerp(h2, other.h2, t)!,
      h3: TextStyle.lerp(h3, other.h3, t)!,
      h4: TextStyle.lerp(h4, other.h4, t)!,
      bXl: TextStyle.lerp(bXl, other.bXl, t)!,
      bL: TextStyle.lerp(bL, other.bL, t)!,
      bM: TextStyle.lerp(bM, other.bM, t)!,
      bS: TextStyle.lerp(bS, other.bS, t)!,
      bXs: TextStyle.lerp(bXs, other.bXs, t)!,
      bXXs: TextStyle.lerp(bXXs, other.bXXs, t)!,
      caption: TextStyle.lerp(caption, other.caption, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppTypography &&
            const DeepCollectionEquality().equals(h0, other.h0) &&
            const DeepCollectionEquality().equals(h1, other.h1) &&
            const DeepCollectionEquality().equals(h2, other.h2) &&
            const DeepCollectionEquality().equals(h3, other.h3) &&
            const DeepCollectionEquality().equals(h4, other.h4) &&
            const DeepCollectionEquality().equals(bXl, other.bXl) &&
            const DeepCollectionEquality().equals(bL, other.bL) &&
            const DeepCollectionEquality().equals(bM, other.bM) &&
            const DeepCollectionEquality().equals(bS, other.bS) &&
            const DeepCollectionEquality().equals(bXs, other.bXs) &&
            const DeepCollectionEquality().equals(bXXs, other.bXXs) &&
            const DeepCollectionEquality().equals(caption, other.caption));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(h0),
      const DeepCollectionEquality().hash(h1),
      const DeepCollectionEquality().hash(h2),
      const DeepCollectionEquality().hash(h3),
      const DeepCollectionEquality().hash(h4),
      const DeepCollectionEquality().hash(bXl),
      const DeepCollectionEquality().hash(bL),
      const DeepCollectionEquality().hash(bM),
      const DeepCollectionEquality().hash(bS),
      const DeepCollectionEquality().hash(bXs),
      const DeepCollectionEquality().hash(bXXs),
      const DeepCollectionEquality().hash(caption),
    );
  }
}
