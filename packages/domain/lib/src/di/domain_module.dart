import 'package:cv_scan_domain/src/repositories/candidate_repository.dart';
import 'package:cv_scan_domain/src/usecases/get_candidate_usecase.dart';
import 'package:cv_scan_domain/src/usecases/get_candidates_usecase.dart';
import 'package:cv_scan_domain/src/usecases/sync_candidates_usecase.dart';
import 'package:cv_scan_domain/src/usecases/update_candidate_usecase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DomainModule {
  GetCandidatesUseCase getCandidates(CandidateRepository repo) => GetCandidatesUseCase(repo);

  GetCandidateUseCase getCandidate(CandidateRepository repo) => GetCandidateUseCase(repo);

  UpdateCandidateUseCase updateCandidate(CandidateRepository repo) => UpdateCandidateUseCase(repo);

  SyncCandidatesUseCase syncCandidates(CandidateRepository repo) => SyncCandidatesUseCase(repo);
}
