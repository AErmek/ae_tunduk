import 'package:cv_scan_app/src/routing/router_state_mixin.dart';
import 'package:cv_scan_app/src/view/app_builder.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class MaterialContext extends StatefulWidget {
  const MaterialContext({super.key});

  @override
  State<MaterialContext> createState() => _MaterialContextState();
}

class _MaterialContextState extends State<MaterialContext> with RouterStateMixin, AppLifecycleMixin {
  @override
  void onPaused() => _lockForOverlay();

  @override
  void onHidden() => _lockForOverlay();

  void _lockForOverlay() {
    final info = authBloc.state.info;
    if (info is AuthorizedUser && info.lockedStatus == UserLockedStatus.unlocked) {
      authBloc.add(const AuthStatusEvent.lockedStatusSet(UserLockedStatus.overlay));
    }
  }

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routerConfig: router,
    theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1A73E8)), useMaterial3: true),
    builder: (context, child) => AppBuilder(router: router, child: child ?? const SizedBox.shrink()),
  );
}
