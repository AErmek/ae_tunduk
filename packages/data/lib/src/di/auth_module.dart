import 'package:cv_scan_data/src/auth/local_auth_biometric_authenticator.dart';
import 'package:cv_scan_data/src/auth/local_auth_service_impl.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

@module
abstract class AuthModule {
  @Singleton(as: BiometricAuthenticator)
  LocalAuthBiometricAuthenticator get biometricAuthenticator =>
      LocalAuthBiometricAuthenticator(localAuth: LocalAuthentication());

  @Singleton(as: LocalAuthService)
  LocalAuthServiceImpl authServices(
    FlutterSecureStorage secureStorage,
    BiometricAuthenticator biometricAuthenticator,
  ) => LocalAuthServiceImpl(secureStorage: secureStorage, bioAuthenticator: biometricAuthenticator);
}
