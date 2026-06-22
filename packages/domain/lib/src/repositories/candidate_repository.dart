import 'package:cv_scan_domain/src/entities/candidate.dart';
import 'package:cv_scan_domain/src/entities/page.dart';
import 'package:cv_scan_domain/src/entities/sync_result.dart';
import 'package:cv_scan_domain/src/enums/candidate_status.dart';
import 'package:cv_scan_domain/src/enums/candidate_verdict.dart';
import 'package:cv_scan_domain/src/enums/sort_field.dart';

abstract interface class CandidateRepository {
  Stream<List<Candidate>> watchCandidates({
    required int page,
    required int size,
    CandidateVerdict? verdict,
    String? query,
    SortField sort,
  });

  Future<Page<Candidate>> fetchCandidates({
    required int page,
    required int size,
    CandidateVerdict? verdict,
    String? query,
    SortField sort,
  });

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
