import 'package:cv_scan_app/src/routing/utils/redirect_chain.dart';
import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';

/// Session gate: keeps unauthenticated users on the entry screens and bounces
/// them back into the app once a session exists. Lock screens are excluded —
/// they belong to the downstream lock guards.
final class AuthenticatedGuard extends RedirectGuard {
  const AuthenticatedGuard(this._authBloc);

  final AuthStatusBloc _authBloc;

  @override
  RouteMatcher get routeMatcher => const PathExcludeMatcher([AppRoutes.lock, AppRoutes.lockDialog]);

  @override
  GuardResult redirect(BuildContext context, GoRouterState state) {
    final path = state.matchedLocation;
    final info = _authBloc.state.info;

    return switch (info) {
      RestoringUser() =>
        path == AppRoutes.restoring ? const GuardStop() : const GuardRedirect(AppRoutes.restoring),
      UnauthorizedUser() =>
        path == AppRoutes.setupPin ? const GuardStop() : const GuardRedirect(AppRoutes.setupPin),
      AuthorizedUser(:final lockedStatus) => _onAuthorized(lockedStatus, path),
    };
  }

  GuardResult _onAuthorized(UserLockedStatus lockedStatus, String path) {
    if (lockedStatus != UserLockedStatus.unlocked) return const GuardNext();

    final onEntryScreen = path == AppRoutes.restoring || path == AppRoutes.setupPin;
    return onEntryScreen ? const GuardRedirect(AppRoutes.candidatesList) : const GuardNext();
  }
}
