import 'package:cv_scan_domain/cv_scan_domain.dart';

/// Outcome of a single sync pass run by [SyncEngine.runOnce].
///
/// [rebased] tells the orchestrator whether a conflict was re-enqueued, i.e.
/// another pass could still make progress. When false, the loop is done.
class SyncPass {
  const SyncPass({this.applied = const [], this.conflicts = const [], this.rebased = false});

  static const empty = SyncPass();

  final List<Candidate> applied;
  final List<SyncConflict> conflicts;
  final bool rebased;
}
