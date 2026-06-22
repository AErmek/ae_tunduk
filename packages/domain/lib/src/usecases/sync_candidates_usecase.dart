import 'package:cv_scan_domain/src/entities/sync_result.dart';
import 'package:cv_scan_domain/src/repositories/candidate_repository.dart';

class SyncCandidatesUseCase {
  const SyncCandidatesUseCase(this._repository);

  final CandidateRepository _repository;

  Future<SyncResult> call() => _repository.sync();
}
