import 'package:cv_scan_domain/src/enums/candidate_status.dart';
import 'package:equatable/equatable.dart';

class CandidateChange extends Equatable {
  const CandidateChange({required this.id, required this.version, required this.status, required this.note});

  final String id;
  final int version;
  final CandidateStatus status;
  final String? note;

  @override
  List<Object?> get props => [id, version, status, note];
}
