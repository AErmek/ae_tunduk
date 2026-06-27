// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:cv_scan_domain/cv_scan_domain.dart' as _i490;
import 'package:cv_scan_domain/src/di/domain_module.dart' as _i1041;
import 'package:injectable/injectable.dart' as _i526;

class CvScanDomainPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final domainModule = _$DomainModule();
    gh.factory<_i490.WatchAuthStatusUseCase>(
        () => domainModule.watchAuthStatus(gh<_i490.AuthRepository>()));
    gh.factory<_i490.SetAuthenticatedUseCase>(
        () => domainModule.setAuthenticated(gh<_i490.AuthRepository>()));
    gh.factory<_i490.SetUnauthenticatedUseCase>(
        () => domainModule.setUnauthenticated(gh<_i490.AuthRepository>()));
    gh.factory<_i490.AuthRestoreStatusUseCase>(
        () => domainModule.authRestoreStatus(gh<_i490.AuthRepository>()));
    gh.factory<_i490.AuthSetLockedStatusUseCase>(
        () => domainModule.authSetLockedStatus(gh<_i490.AuthRepository>()));
    gh.factory<_i490.GetCandidatesUseCase>(
        () => domainModule.getCandidates(gh<_i490.CandidateRepository>()));
    gh.factory<_i490.FetchCandidatesUseCase>(
        () => domainModule.fetchCandidates(gh<_i490.CandidateRepository>()));
    gh.factory<_i490.GetCandidateUseCase>(
        () => domainModule.getCandidate(gh<_i490.CandidateRepository>()));
    gh.factory<_i490.UpdateCandidateUseCase>(
        () => domainModule.updateCandidate(gh<_i490.CandidateRepository>()));
    gh.factory<_i490.SyncCandidatesUseCase>(
        () => domainModule.syncCandidates(gh<_i490.CandidateRepository>()));
  }
}

class _$DomainModule extends _i1041.DomainModule {}
