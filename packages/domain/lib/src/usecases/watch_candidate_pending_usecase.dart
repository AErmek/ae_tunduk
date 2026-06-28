import 'package:cv_scan_domain/src/repositories/candidate_repository.dart';

/// Emits whether the given candidate has an unsynced change in the outbox.
class WatchCandidatePendingUseCase {
  const WatchCandidatePendingUseCase(this._repository);

  final CandidateRepository _repository;

  Stream<bool> call(String id) => _repository.watchCandidatePending(id);
}
