import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AppRouter)
class AppRouterImpl implements AppRouter {
  AppRouterImpl(this._router);

  final GoRouter _router;

  @override
  void goToCandidatesList() => _router.go(AppRoutes.candidatesList);

  @override
  void goToCandidateDetail(String id) => _router.go(AppRoutes.candidateDetailPath(id));

  @override
  void goBack() => _router.pop();
}
