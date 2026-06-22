import 'package:equatable/equatable.dart';
import 'package:cv_scan_domain/src/enums/candidate_status.dart';

class SyncChange extends Equatable {
  const SyncChange({
    required this.id,
    required this.baseVersion,
    required this.clientUpdatedAt,
    this.status,
    this.note,
  });

  final String id;
  final int baseVersion;
  final DateTime clientUpdatedAt;
  final CandidateStatus? status;
  final String? note;

  @override
  List<Object?> get props => [id, baseVersion, clientUpdatedAt, status, note];
}
