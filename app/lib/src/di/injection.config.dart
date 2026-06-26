// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cv_scan_app/src/di/app_module.dart' as _i489;
import 'package:cv_scan_data/cv_scan_data.dart' as _i755;
import 'package:cv_scan_domain/cv_scan_domain.dart' as _i490;
import 'package:feature_auth/feature_auth.dart' as _i277;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.singleton<_i558.FlutterSecureStorage>(() => appModule.secureStorage);
    await _i277.FeatureAuthPackageModule().init(gh);
    await _i755.CvScanDataPackageModule().init(gh);
    await _i490.CvScanDomainPackageModule().init(gh);
    return this;
  }
}

class _$AppModule extends _i489.AppModule {}
