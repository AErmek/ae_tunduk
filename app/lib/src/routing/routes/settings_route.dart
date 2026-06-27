import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';

class SettingsBranch {
  const SettingsBranch();

  StatefulShellBranch get branch => StatefulShellBranch(
    routes: [
      GoRoute(path: AppRoutes.settings, builder: (_, _) => const SettingsScreen()),
    ],
  );
}
