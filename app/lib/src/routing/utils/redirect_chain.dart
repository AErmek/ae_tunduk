import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class RedirectChain {
  const RedirectChain(this._guards);

  final List<RedirectGuard> _guards;

  String? call(BuildContext context, GoRouterState state) {
    for (final guard in _guards) {
      if (!guard.routeMatcher.matches(state.matchedLocation)) {
        continue;
      }

      final result = guard.redirect(context, state);

      switch (result) {
        case GuardRedirect(:final location):
          return location;
        case GuardStop():
          return null;
        case GuardNext():
          continue;
      }
    }
    return null;
  }
}

abstract base class RedirectGuard {
  const RedirectGuard();
  RouteMatcher get routeMatcher;
  GuardResult redirect(BuildContext context, GoRouterState state);
}
