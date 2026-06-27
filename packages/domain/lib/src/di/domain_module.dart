import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DomainModule {
  GetCandidatesUseCase getCandidates(CandidateRepository repo) => GetCandidatesUseCase(repo);

  FetchCandidatesUseCase fetchCandidates(CandidateRepository repo) => FetchCandidatesUseCase(repo);

  GetCandidateUseCase getCandidate(CandidateRepository repo) => GetCandidateUseCase(repo);

  UpdateCandidateUseCase updateCandidate(CandidateRepository repo) => UpdateCandidateUseCase(repo);

  SyncCandidatesUseCase syncCandidates(CandidateRepository repo) => SyncCandidatesUseCase(repo);

  WatchAuthStatusUseCase watchAuthStatus(AuthRepository repo) => WatchAuthStatusUseCase(repo);

  SetAuthenticatedUseCase setAuthenticated(AuthRepository repo) => SetAuthenticatedUseCase(repo);

  SetUnauthenticatedUseCase setUnauthenticated(AuthRepository repo) => SetUnauthenticatedUseCase(repo);

  AuthRestoreStatusUseCase authRestoreStatus(AuthRepository repo) => AuthRestoreStatusUseCase(repo);

  AuthSetLockedStatusUseCase authSetLockedStatus(AuthRepository repo) => AuthSetLockedStatusUseCase(repo);
}
