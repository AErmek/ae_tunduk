part of 'app_routes_meta.dart';

class SettingsBranch extends StatefulShellBranchData {
  const SettingsBranch();
}

class SettingsRoute extends GoRouteData with $SettingsRoute {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SettingsScreen();
}
