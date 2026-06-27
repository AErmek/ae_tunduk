import 'package:cv_scan_app/src/routing/utils/redirect_chain.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';

/// Owns the full-screen [AppRoutes.lock]: pins a cold-started session to it and
/// releases it once unlocked. Excludes the overlay route — that is the next
/// guard's concern.
final class ColdStartGuard extends RedirectGuard {
  const ColdStartGuard(this._authBloc);

  final AuthStatusBloc _authBloc;

  @override
  RouteMatcher get routeMatcher => const AnyRouteMatcher();

  @override
  GuardResult redirect(BuildContext context, GoRouterState state) {
    final info = _authBloc.state.info;
    if (info is! AuthorizedUser) return const GuardNext();

    final path = state.matchedLocation;
    final onLock = path == AppRoutes.lock;

    if (info.lockedStatus == UserLockedStatus.coldStart) {
      return onLock ? const GuardStop() : const GuardRedirect(AppRoutes.lock);
    }
    return onLock ? const GuardRedirect(AppRoutes.candidatesList) : const GuardNext();
  }
}
