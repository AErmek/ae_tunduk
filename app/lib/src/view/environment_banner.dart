import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnvironmentBanner extends StatelessWidget {
  const EnvironmentBanner({required this.child, super.key});

  final Widget child;
  @override
  Widget build(BuildContext context) => switch (Config.i.env) {
    AppEnvironment.prod => child,
    _ => Directionality(
      textDirection: TextDirection.ltr,
      child: Banner(
        message: 'f:$appFlavor e:${Config.i.env.name}',
        textDirection: TextDirection.ltr,
        location: BannerLocation.topEnd,
        color: context.themeColors.success,
        textStyle: context.theme.style((t) => t.bXXs.sb, (c) => c.onSuccess),
        child: child,
      ),
    ),
  };
}
