import 'package:cv_scan_app/src/routing/routes/app_routes_meta.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';

/// Owns the full-screen lock: pins a cold-started session to it and releases it
/// once unlocked. The requested location is stashed via [redirectPreserving] so
/// a deep link survives the gate and resumes after unlock.
final class ColdStartGuard extends RedirectGuard {
  const ColdStartGuard(this._authBloc);

  final AuthStatusBloc _authBloc;

  @override
  RouteMatcher get routeMatcher => const AnyRouteMatcher();

  @override
  GuardResult redirect(GoRouterState state) {
    final info = _authBloc.state.info;
    if (info is! AuthorizedUser) return const GuardNext();

    final lock = const LockRoute().location;
    final onLock = state.matchedLocation == lock;

    if (info.lockedStatus == UserLockedStatus.coldStart) {
      return onLock ? const GuardStop() : redirectPreserving(lock, state);
    }

    if (!onLock) return const GuardNext();
    return GuardRedirect(resumeTarget(state) ?? const CandidatesRoute().location);
  }
}
