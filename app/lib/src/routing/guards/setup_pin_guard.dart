import 'package:cv_scan_app/src/routing/utils/redirect_chain.dart';
import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class SetupPinGuard extends RedirectGuard with ChangeNotifier {
  SetupPinGuard(PinService pinService) {
    pinService.hasPin().then((v) {
      _hasPin = v;
      notifyListeners();
    });
  }

  bool? _hasPin;

  void markPinCreated() {
    _hasPin = true;
    notifyListeners();
  }

  @override
  RouteMatcher get routeMatcher => const PathExcludeMatcher([AppRoutes.lock, AppRoutes.setupPin]);

  @override
  GuardResult redirect(BuildContext context, GoRouterState state) {
    if (_hasPin == null) return const GuardStop();
    if (!_hasPin!) return const GuardRedirect(AppRoutes.setupPin);
    return const GuardNext();
  }
}
