import 'package:cv_scan_app/src/view/environment_banner.dart';
import 'package:cv_scan_app/src/view/material_context.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class RootContext extends StatelessWidget {
  const RootContext({super.key});

  @override
  Widget build(BuildContext context) => const AuthScope(
    child: EnvironmentBanner(
      // child: AppSystemUiOverlayConfig(child:
      child: MaterialContext(),
    ),
  );
}
