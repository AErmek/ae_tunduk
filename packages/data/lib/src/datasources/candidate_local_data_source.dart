import 'package:cv_scan_domain/cv_scan_domain.dart';

/// Local source of candidates. Owns the mirror cache and the outbox, hides
/// drift, and applies pending changes (overlay) on reads — speaks only in
/// domain types.
abstract interface class CandidateLocalDataSource {
  Stream<List<CandidateLight>> watchCandidates({
    required int limit,
    CandidateVerdict? verdict,
    String? query,
    SortField sort,
  });

  Stream<Candidate?> watchCandidate(String id);

  Stream<bool> watchCandidatePending(String id);

  Future<Candidate?> getCandidate(String id);

  Future<List<Candidate>> getCandidates();

  Future<void> cacheCandidates(List<Candidate> candidates);

  Future<void> cacheCandidate(Candidate candidate);

  Future<void> enqueueUpdate({
    required String id,
    required int version,
    CandidateStatus? status,
    String? note,
  });

  /// Wipes the mirror and the outbox — used on logout so no candidate data or
  /// pending change outlives the session.
  Future<void> clear();
}
