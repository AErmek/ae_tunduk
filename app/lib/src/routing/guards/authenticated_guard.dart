import 'package:cv_scan_app/src/routing/routes/app_routes_meta.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';

/// Session gate: keeps unauthenticated users on the entry screens and bounces
/// them back into the app once a session exists. The lock screen is excluded —
/// it belongs to the downstream lock guards.
final class AuthenticatedGuard extends RedirectGuard {
  const AuthenticatedGuard(this._authBloc);

  final AuthStatusBloc _authBloc;

  @override
  RouteMatcher get routeMatcher => ~PathMatcher([const LockRoute().location]);

  @override
  GuardResult redirect(GoRouterState state) {
    final path = state.matchedLocation;

    return switch (_authBloc.state.info) {
      RestoringUser() => _pinTo(const RestoringRoute().location, path),
      UnauthorizedUser() => _pinTo(const SetupPinRoute().location, path),
      AuthorizedUser(:final lockedStatus) => _onAuthorized(lockedStatus, path),
    };
  }

  GuardResult _pinTo(String target, String path) => path == target ? const GuardStop() : GuardRedirect(target);

  GuardResult _onAuthorized(UserLockedStatus lockedStatus, String path) {
    if (lockedStatus != UserLockedStatus.unlocked) return const GuardNext();

    final onEntryScreen = path == const RestoringRoute().location || path == const SetupPinRoute().location;
    return onEntryScreen ? GuardRedirect(const CandidatesRoute().location) : const GuardNext();
  }
}
