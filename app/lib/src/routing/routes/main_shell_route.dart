part of 'app_routes_meta.dart';

@TypedStatefulShellRoute<MainShellRoute>(
  branches: [
    TypedStatefulShellBranch<CandidatesBranch>(
      routes: [
        TypedGoRoute<CandidatesRoute>(
          path: AppRoutes.candidatesList,
          routes: [TypedGoRoute<CandidateDetailRoute>(path: ':id')],
        ),
      ],
    ),
    TypedStatefulShellBranch<SettingsBranch>(
      routes: [TypedGoRoute<SettingsRoute>(path: AppRoutes.settings)],
    ),
  ],
)
class MainShellRoute extends StatefulShellRouteData {
  const MainShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) =>
      MainScreen(navigationShell: navigationShell);
}
