// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes_meta.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $restoringRoute,
  $lockRoute,
  $setupPinRoute,
  $mainShellRoute,
];

RouteBase get $restoringRoute =>
    GoRouteData.$route(path: '/restoring', factory: $RestoringRoute._fromState);

mixin $RestoringRoute on GoRouteData {
  static RestoringRoute _fromState(GoRouterState state) =>
      const RestoringRoute();

  @override
  String get location => GoRouteData.$location('/restoring');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $lockRoute =>
    GoRouteData.$route(path: '/lock', factory: $LockRoute._fromState);

mixin $LockRoute on GoRouteData {
  static LockRoute _fromState(GoRouterState state) => const LockRoute();

  @override
  String get location => GoRouteData.$location('/lock');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $setupPinRoute =>
    GoRouteData.$route(path: '/setup-pin', factory: $SetupPinRoute._fromState);

mixin $SetupPinRoute on GoRouteData {
  static SetupPinRoute _fromState(GoRouterState state) => const SetupPinRoute();

  @override
  String get location => GoRouteData.$location('/setup-pin');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $mainShellRoute => StatefulShellRouteData.$route(
  factory: $MainShellRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/candidates',
          factory: $CandidatesRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: ':id',
              parentNavigatorKey: CandidateDetailRoute.$parentNavigatorKey,
              factory: $CandidateDetailRoute._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/settings',
          factory: $SettingsRoute._fromState,
        ),
      ],
    ),
  ],
);

extension $MainShellRouteExtension on MainShellRoute {
  static MainShellRoute _fromState(GoRouterState state) =>
      const MainShellRoute();
}

mixin $CandidatesRoute on GoRouteData {
  static CandidatesRoute _fromState(GoRouterState state) =>
      const CandidatesRoute();

  @override
  String get location => GoRouteData.$location('/candidates');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CandidateDetailRoute on GoRouteData {
  static CandidateDetailRoute _fromState(GoRouterState state) =>
      CandidateDetailRoute(id: state.pathParameters['id']!);

  CandidateDetailRoute get _self => this as CandidateDetailRoute;

  @override
  String get location =>
      GoRouteData.$location('/candidates/${Uri.encodeComponent(_self.id)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SettingsRoute on GoRouteData {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  @override
  String get location => GoRouteData.$location('/settings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
