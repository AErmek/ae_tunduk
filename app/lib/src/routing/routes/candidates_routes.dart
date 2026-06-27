part of 'app_routes_meta.dart';

class CandidatesBranch extends StatefulShellBranchData {
  const CandidatesBranch();
}

class CandidatesRoute extends GoRouteData with $CandidatesRoute {
  const CandidatesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const CandidatesListScreen();
}

class CandidateDetailRoute extends GoRouteData with $CandidateDetailRoute {
  const CandidateDetailRoute({required this.id});

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) => CandidateDetailPage(id: id);
}
