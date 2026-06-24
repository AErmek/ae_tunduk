import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:feature_candidate_detail/feature_candidate_detail.dart';
import 'package:feature_candidates_list/feature_candidates_list.dart';
import 'package:go_router/go_router.dart';

final appRoutes = <RouteBase>[
  GoRoute(
    path: AppRoutes.candidatesList,
    builder: (_, _) => const CandidatesListPage(),
    routes: [
      GoRoute(
        path: ':id',
        builder: (_, state) => CandidateDetailPage(id: state.pathParameters['id']!),
      ),
    ],
  ),
];
