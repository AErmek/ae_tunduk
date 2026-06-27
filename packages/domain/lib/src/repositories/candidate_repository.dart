import 'package:cv_scan_domain/src/entities/candidate.dart';
import 'package:cv_scan_domain/src/entities/candidates_filter.dart';
import 'package:cv_scan_domain/src/entities/page.dart';
import 'package:cv_scan_domain/src/entities/sync_result.dart';
import 'package:cv_scan_domain/src/enums/candidate_status.dart';

abstract interface class CandidateRepository {
  Stream<List<Candidate>> watchCandidates(CandidatesFilter filter);

  Future<Page<Candidate>> fetchCandidates(CandidatesFilter filter);

  Stream<Candidate?> watchCandidate(String id);

  Future<Candidate> fetchCandidate(String id);

  Future<Candidate> updateCandidate({
    required String id,
    required int version,
    CandidateStatus? status,
    String? note,
  });

  Future<SyncResult> sync();
}
