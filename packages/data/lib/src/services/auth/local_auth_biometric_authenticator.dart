import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:local_auth/local_auth.dart';

final class LocalAuthBiometricAuthenticator implements BiometricAuthenticator {
  LocalAuthBiometricAuthenticator({required this._localAuth});

  final LocalAuthentication _localAuth;

  @override
  Future<bool> authenticate({required String localizedReason}) => _localAuth.authenticate(
    localizedReason: localizedReason,
    options: const AuthenticationOptions(biometricOnly: true, stickyAuth: true),
  );

  @override
  Future<bool> get canCheckBiometrics => _localAuth.canCheckBiometrics;

  @override
  Future<bool> isDeviceSupported() => _localAuth.isDeviceSupported();
}
