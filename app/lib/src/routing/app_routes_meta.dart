import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:feature_candidate_detail/feature_candidate_detail.dart';
import 'package:feature_candidates_list/feature_candidates_list.dart';
import 'package:go_router/go_router.dart';

final appRoutesMeta = <RouteBase>[
  GoRoute(path: AppRoutes.restoring, builder: (_, _) => const RestoringPage()),
  GoRoute(path: AppRoutes.lock, builder: (_, _) => const LockPage()),
  GoRoute(path: AppRoutes.setupPin, builder: (_, _) => const SetupPinPage()),
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
