import 'package:cv_scan_app/src/routing/lock_overlay_controller.dart';
import 'package:cv_scan_app/src/routing/router_state_mixin.dart';
import 'package:cv_scan_app/src/view/app_builder.dart';
import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:flutter/material.dart';

class MaterialContext extends StatefulWidget {
  const MaterialContext({super.key});

  @override
  State<MaterialContext> createState() => _MaterialContextState();
}

class _MaterialContextState extends State<MaterialContext> with RouterStateMixin {
  late final LockOverlayController _lockOverlay;

  @override
  void initState() {
    super.initState();
    _lockOverlay = LockOverlayController(authBloc: authBloc)..start();
  }

  @override
  void dispose() {
    _lockOverlay.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    debugShowCheckedModeBanner: false,

    locale: AppLocaleConfig.currentLocale,
    supportedLocales: AppLocaleConfig.supportedLocales,
    localizationsDelegates: AppLocaleConfig.localizationDelegates,

    routerConfig: router,
    theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1A73E8)), useMaterial3: true),
    builder: (context, child) => AppBuilder(child: child ?? const SizedBox.shrink()),
  );
}
