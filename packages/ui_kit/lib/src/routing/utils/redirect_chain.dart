import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class RedirectChain {
  const RedirectChain(this._guards);

  final List<RedirectGuard> _guards;

  String? call(BuildContext context, GoRouterState state) {
    for (final guard in _guards) {
      if (!guard.routeMatcher.matches(state)) {
        continue;
      }

      switch (guard.redirect(state)) {
        case GuardRedirect(:final location):
          return location == state.uri.toString() ? null : location;
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

  GuardResult redirect(GoRouterState state);

  /// Redirects to [to] while stashing the requested location, so a deep link
  /// can be resumed once the gate clears.
  GuardResult redirectPreserving(String to, GoRouterState state) =>
      GuardRedirect('$to?from=${Uri.encodeComponent(state.uri.toString())}');

  /// The location stashed by [redirectPreserving], if any.
  String? resumeTarget(GoRouterState state) {
    final from = state.uri.queryParameters['from'];
    return from == null || from.isEmpty ? null : from;
  }
}
