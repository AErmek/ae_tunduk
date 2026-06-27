import 'dart:math' as math;

import 'package:cv_scan_ui_kit/src/theme/config/spacing.dart';
import 'package:flutter/material.dart';

/// Улучшенная версия EdgeInsets на базе Spacing-токенов
final class SpacePadding extends EdgeInsets {
  const SpacePadding._({super.left, super.top, super.right, super.bottom}) : super.only();

  // ────────────────────────────────────────────────
  // Основные удобные конструкторы
  // ────────────────────────────────────────────────

  factory SpacePadding.all(Spacing value) =>
      SpacePadding._(left: value.value, top: value.value, right: value.value, bottom: value.value);

  factory SpacePadding.symmetric({Spacing? horizontal, Spacing? vertical}) => SpacePadding._(
    left: horizontal?.value ?? 0,
    right: horizontal?.value ?? 0,
    top: vertical?.value ?? 0,
    bottom: vertical?.value ?? 0,
  );

  factory SpacePadding.vertical(Spacing value) => SpacePadding._(top: value.value, bottom: value.value);

  factory SpacePadding.horizontal(Spacing value) => SpacePadding._(left: value.value, right: value.value);

  factory SpacePadding.only({Spacing? left, Spacing? top, Spacing? right, Spacing? bottom}) => SpacePadding._(
    left: left?.value ?? 0,
    top: top?.value ?? 0,
    right: right?.value ?? 0,
    bottom: bottom?.value ?? 0,
  );

  // ────────────────────────────────────────────────
  // Responsive / контекстные варианты
  // ────────────────────────────────────────────────

  /// Центрированный контент с максимальной шириной (часто для карточек/форм на десктопе)
  factory SpacePadding.centerContent(
    Size size, {
    required double maxContentWidth,
    Spacing minPadding = const Spacing(4),
  }) {
    final horizontal = math.max((size.width - maxContentWidth) / 2, minPadding.value);
    return SpacePadding._(left: horizontal, right: horizontal);
  }

  // Можно добавить позже:
  // factory SpacePadding.fromTheme(BuildContext context) { ... }
}

// // ────────────────────────────────────────────────
// // Приватные реализации (для const)
// class _All extends SpacePadding {
//   const _All(Spacing value) : super._(left: value.value, top: value.value, right: value.value, bottom: value.value);
// }

// class _Symmetric extends SpacePadding {
//   const _Symmetric({Spacing? horizontal, Spacing? vertical})
//     : super._(
//         left: horizontal?.value ?? 0,
//         right: horizontal?.value ?? 0,
//         top: vertical?.value ?? 0,
//         bottom: vertical?.value ?? 0,
//       );
// }

// class _Vertical extends SpacePadding {
//   const _Vertical(Spacing value) : super._(top: value.value, bottom: value.value);
// }

// class _Horizontal extends SpacePadding {
//   const _Horizontal(Spacing value) : super._(left: value.value, right: value.value);
// }

// class _Only extends SpacePadding {
//   const _Only({Spacing? left, Spacing? top, Spacing? right, Spacing? bottom})
//     : super._(left: left?.value ?? 0, top: top?.value ?? 0, right: right?.value ?? 0, bottom: bottom?.value ?? 0);
// }
