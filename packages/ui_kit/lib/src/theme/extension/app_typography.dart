import 'package:flutter/material.dart';

class AppTypography extends ThemeExtension<AppTypography> {
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
    if (other is! AppTypography) return this;
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
}
