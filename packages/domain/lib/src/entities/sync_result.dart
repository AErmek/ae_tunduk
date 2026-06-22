import 'package:equatable/equatable.dart';
import 'package:cv_scan_domain/src/entities/candidate.dart';
import 'package:cv_scan_domain/src/entities/sync_conflict.dart';

class SyncResult extends Equatable {
  const SyncResult({
    required this.applied,
    required this.conflicts,
  });

  final List<Candidate> applied;
  final List<SyncConflict> conflicts;

  bool get hasConflicts => conflicts.isNotEmpty;

  @override
  List<Object?> get props => [applied, conflicts];
}
