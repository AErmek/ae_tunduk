// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:cv_scan_data/cv_scan_data.dart' as _i755;
import 'package:cv_scan_data/src/di/data_module.dart' as _i814;
import 'package:cv_scan_domain/cv_scan_domain.dart' as _i490;
import 'package:dio/dio.dart' as _i361;
import 'package:injectable/injectable.dart' as _i526;

class CvScanDataPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final dataModule = _$DataModule();
    gh.singleton<_i755.AppDatabase>(() => dataModule.database);
    gh.singleton<_i755.CandidatesDao>(
        () => dataModule.candidatesDao(gh<_i755.AppDatabase>()));
    gh.singleton<_i755.OutboxDao>(
        () => dataModule.outboxDao(gh<_i755.AppDatabase>()));
    gh.singleton<_i490.AuthRepository>(
        () => dataModule.authRepository(gh<_i490.LocalAuthService>()));
    gh.lazySingleton<_i361.Dio>(
        () => dataModule.dio(gh<_i755.CandidatesDao>()));
    gh.lazySingleton<_i755.ApiClient>(
        () => dataModule.apiClient(gh<_i361.Dio>()));
    gh.singleton<_i755.SyncEngine>(() => dataModule.syncEngine(
          gh<_i755.ApiClient>(),
          gh<_i755.CandidatesDao>(),
          gh<_i755.OutboxDao>(),
        ));
    gh.lazySingleton<_i490.CandidateRepository>(
        () => dataModule.candidateRepository(
              gh<_i755.ApiClient>(),
              gh<_i755.CandidatesDao>(),
              gh<_i755.OutboxDao>(),
              gh<_i755.SyncEngine>(),
            ));
  }
}

class _$DataModule extends _i814.DataModule {}
