import 'package:cv_scan_app/src/routing/routes/main_shell_route.dart';
import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:go_router/go_router.dart';

final appRoutesMeta = <RouteBase>[
  GoRoute(path: AppRoutes.restoring, builder: (_, _) => const RestoringScreen()),
  GoRoute(path: AppRoutes.lock, builder: (_, _) => const LockScreen()),
  GoRoute(path: AppRoutes.setupPin, builder: (_, _) => const SetupPinScreen()),
  const MainShellRoute().route,
];
