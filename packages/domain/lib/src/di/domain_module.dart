import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DomainModule {
  GetCandidatesUseCase getCandidates(CandidateRepository repo) => GetCandidatesUseCase(repo);

  FetchCandidatesUseCase fetchCandidates(CandidateRepository repo) => FetchCandidatesUseCase(repo);

  GetCandidateUseCase getCandidate(CandidateRepository repo) => GetCandidateUseCase(repo);

  FetchCandidateUseCase fetchCandidate(CandidateRepository repo) => FetchCandidateUseCase(repo);

  WatchCandidatePendingUseCase watchCandidatePending(CandidateRepository repo) =>
      WatchCandidatePendingUseCase(repo);

  UpdateCandidateUseCase updateCandidate(CandidateRepository repo) => UpdateCandidateUseCase(repo);

  WatchSyncSnapshotUseCase watchSyncSnapshot(SyncScheduler scheduler) => WatchSyncSnapshotUseCase(scheduler);

  TriggerSyncUseCase triggerSync(SyncScheduler scheduler) => TriggerSyncUseCase(scheduler);

  WatchAuthStatusUseCase watchAuthStatus(AuthRepository repo) => WatchAuthStatusUseCase(repo);

  SetAuthenticatedUseCase setAuthenticated(AuthRepository repo) => SetAuthenticatedUseCase(repo);

  SetUnauthenticatedUseCase setUnauthenticated(AuthRepository repo) => SetUnauthenticatedUseCase(repo);

  LogoutUseCase logout(AuthRepository auth, CandidateRepository candidates) => LogoutUseCase(auth, candidates);

  AuthRestoreStatusUseCase authRestoreStatus(AuthRepository repo) => AuthRestoreStatusUseCase(repo);

  AuthSetLockedStatusUseCase authSetLockedStatus(AuthRepository repo) => AuthSetLockedStatusUseCase(repo);
}
