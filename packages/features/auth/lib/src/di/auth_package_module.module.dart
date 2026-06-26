// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:cv_scan_domain/cv_scan_domain.dart' as _i490;
import 'package:feature_auth/src/di/auth_module.dart' as _i723;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:injectable/injectable.dart' as _i526;

class FeatureAuthPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final authModule = _$AuthModule();
    gh.singleton<_i490.BiometricAuthenticator>(
        () => authModule.biometricAuthenticator);
    gh.singleton<_i490.LocalAuthService>(() => authModule.authServices(
          gh<_i558.FlutterSecureStorage>(),
          gh<_i490.BiometricAuthenticator>(),
        ));
  }
}

class _$AuthModule extends _i723.AuthModule {}
