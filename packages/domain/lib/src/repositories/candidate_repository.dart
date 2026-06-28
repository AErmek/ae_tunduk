import 'package:cv_scan_domain/src/entities/candidate.dart';
import 'package:cv_scan_domain/src/entities/candidate_light.dart';
import 'package:cv_scan_domain/src/entities/candidates_filter.dart';
import 'package:cv_scan_domain/src/entities/page.dart';
import 'package:cv_scan_domain/src/enums/candidate_status.dart';

abstract interface class CandidateRepository {
  Stream<List<CandidateLight>> watchCandidates(CandidatesFilter filter);

  Future<Page<CandidateLight>> fetchCandidates(CandidatesFilter filter);

  Stream<Candidate?> watchCandidate(String id);

  /// Emits whether [id] has an unsynced change waiting in the outbox.
  Stream<bool> watchCandidatePending(String id);

  Future<Candidate> fetchCandidate(String id);

  Future<Candidate> updateCandidate({
    required String id,
    required int version,
    CandidateStatus? status,
    String? note,
  });

  /// Drops all locally cached candidates and pending changes (e.g. on logout).
  Future<void> clearLocalData();
}
