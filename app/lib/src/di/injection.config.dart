// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cv_scan_app/src/di/app_module.dart' as _i489;
import 'package:cv_scan_app/src/routing/app_router_impl.dart' as _i656;
import 'package:cv_scan_core/cv_scan_core.dart' as _i17;
import 'package:cv_scan_data/cv_scan_data.dart' as _i755;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:go_router/go_router.dart' as _i583;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.singleton<_i755.AppDatabase>(() => appModule.database);
    gh.singleton<_i583.GoRouter>(() => appModule.router());
    gh.singleton<_i361.Dio>(() => appModule.dio(gh<_i755.CandidatesDao>()));
    gh.singleton<_i17.AppRouter>(
      () => _i656.AppRouterImpl(gh<_i583.GoRouter>()),
    );
    gh.singleton<_i755.ApiClient>(() => appModule.apiClient(gh<_i361.Dio>()));
    return this;
  }
}

class _$AppModule extends _i489.AppModule {}
