import 'package:cv_scan_app/src/routing/utils/redirect_chain.dart';
import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';

/// Owns the full-screen dialog [AppRoutes.lockDialog] shown when the app is
/// resumed from background. Instead of replacing the stack, it appends the
/// dialog on top and remembers the route underneath in the `from` query, then
/// strips it back once the session is unlocked. Excludes the cold-start lock.
final class LockOverlayGuard extends RedirectGuard {
  const LockOverlayGuard(this._authBloc);

  static const _fromParam = 'from';

  final AuthStatusBloc _authBloc;

  @override
  RouteMatcher get routeMatcher => const PathExcludeMatcher([AppRoutes.lock]);

  @override
  GuardResult redirect(BuildContext context, GoRouterState state) {
    final info = _authBloc.state.info;
    if (info is! AuthorizedUser) return const GuardNext();

    final onDialog = state.matchedLocation == AppRoutes.lockDialog;

    if (info.lockedStatus == UserLockedStatus.overlay) {
      if (onDialog) return const GuardStop();
      final from = Uri.encodeComponent(state.uri.toString());
      return GuardRedirect('${AppRoutes.lockDialog}?$_fromParam=$from');
    }

    if (onDialog) {
      final from = state.uri.queryParameters[_fromParam];
      return GuardRedirect(from == null ? AppRoutes.candidatesList : Uri.decodeComponent(from));
    }
    return const GuardNext();
  }
}
