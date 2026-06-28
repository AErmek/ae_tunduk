import 'package:cv_scan_domain/cv_scan_domain.dart';

/// Result of one sync pass. [rebased] means another pass may still help.
class SyncPass {
  const SyncPass({this.applied = const [], this.conflicts = const [], this.rebased = false});

  static const empty = SyncPass();

  final List<Candidate> applied;
  final List<SyncConflict> conflicts;
  final bool rebased;
}
