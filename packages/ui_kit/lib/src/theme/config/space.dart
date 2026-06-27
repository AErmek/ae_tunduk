import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  const Space._({required this.width, required this.height, super.key});

  const factory Space.h([Spacing? spacing, double? raw]) = _HorizontalSpace;

  const factory Space.v([Spacing? spacing, double? raw]) = _VerticalSpace;

  final SpaceProp? width;
  final SpaceProp? height;

  @override
  Widget build(BuildContext context) => SizedBox(width: width?.valueClamped ?? 0, height: height?.valueClamped ?? 0);
}

class _HorizontalSpace extends Space {
  const _HorizontalSpace([Spacing? spacing, double? raw]) : super._(width: (spacing: spacing, raw: raw), height: null);
}

class _VerticalSpace extends Space {
  const _VerticalSpace([Spacing? spacing, double? raw]) : super._(width: null, height: (spacing: spacing, raw: raw));
}

typedef SpaceProp = ({Spacing? spacing, double? raw});

extension PropX on SpaceProp {
  double get value => spacing?.value ?? raw ?? 0;
  double get valueClamped => value.clamp(0, double.infinity);
}
