import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:feature_auth/src/service/local_auth_service_impl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

@module
abstract class AuthModule {
  @singleton
  LocalAuthentication get localAuthentication => LocalAuthentication();

  @Singleton(as: LocalAuthServices)
  LocalAuthServiceImpl pinService(FlutterSecureStorage secureStorage, LocalAuthentication localAuth) =>
      LocalAuthServiceImpl(secureStorage: secureStorage, localAuth: localAuth);
}
