import 'package:cv_scan_app/src/routing/routes.dart';
import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.candidatesList,
  routes: appRoutes,
);
