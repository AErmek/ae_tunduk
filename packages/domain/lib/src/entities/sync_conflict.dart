import 'package:cv_scan_domain/src/entities/candidate.dart';
import 'package:equatable/equatable.dart';

class SyncConflict extends Equatable {
  const SyncConflict({required this.id, required this.currentVersion, required this.current});

  final String id;
  final int currentVersion;
  final Candidate current;

  @override
  List<Object?> get props => [id, currentVersion, current];
}
