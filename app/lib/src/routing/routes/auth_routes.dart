part of 'app_routes_meta.dart';

@TypedGoRoute<RestoringRoute>(path: AppRoutes.restoring)
class RestoringRoute extends GoRouteData with $RestoringRoute {
  const RestoringRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const RestoringScreen();
}

@TypedGoRoute<LockRoute>(path: AppRoutes.lock)
class LockRoute extends GoRouteData with $LockRoute {
  const LockRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const LockScreen();
}

@TypedGoRoute<SetupPinRoute>(path: AppRoutes.setupPin)
class SetupPinRoute extends GoRouteData with $SetupPinRoute {
  const SetupPinRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SetupPinScreen();
}
