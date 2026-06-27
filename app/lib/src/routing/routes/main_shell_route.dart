import 'package:cv_scan_app/src/routing/routes/candidates_route.dart';
import 'package:cv_scan_app/src/routing/routes/settings_route.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';

class MainShellRoute {
  const MainShellRoute();

  RouteBase get route => StatefulShellRoute.indexedStack(
    builder: (_, _, navigationShell) => MainScreen(navigationShell: navigationShell),
    branches: [
      const CandidatesBranch().branch,
      const SettingsBranch().branch,
    ],
  );
}
