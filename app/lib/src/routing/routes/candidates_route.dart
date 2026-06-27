import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:feature_candidate_detail/feature_candidate_detail.dart';
import 'package:feature_candidates_list/feature_candidates_list.dart';
import 'package:go_router/go_router.dart';

class CandidatesBranch {
  const CandidatesBranch();

  StatefulShellBranch get branch => StatefulShellBranch(
    routes: [
      GoRoute(
        path: AppRoutes.candidatesList,
        builder: (_, _) => const CandidatesListScreen(),
        routes: [
          GoRoute(
            path: ':id',
            builder: (_, state) => CandidateDetailPage(id: state.pathParameters['id']!),
          ),
        ],
      ),
    ],
  );
}
