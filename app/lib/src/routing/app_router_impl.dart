import 'package:cv_scan_app/src/routing/routes/app_routes_meta.dart';
import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:go_router/go_router.dart';

class AppRouterImpl implements AppRouter {
  AppRouterImpl(this._router);

  final GoRouter _router;

  @override
  void goToCandidatesList() => _router.go(const CandidatesRoute().location);

  @override
  void goToCandidateDetail(String id) => _router.go(CandidateDetailRoute(id: id).location);

  @override
  void goBack() => _router.pop();
}
