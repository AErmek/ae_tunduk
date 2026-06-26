import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:cv_scan_data/src/auth/pin_columns.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalAuthServiceImpl implements LocalAuthService {
  LocalAuthServiceImpl({required FlutterSecureStorage secureStorage, required this._bioAuthenticator})
    : _pinHash = PinHashColumn(secureStorage: secureStorage),
      _pinSalt = PinSaltColumn(secureStorage: secureStorage),
      _biometricEnabled = BiometricEnabledColumn(secureStorage: secureStorage);

  final PinHashColumn _pinHash;
  final PinSaltColumn _pinSalt;
  final BiometricEnabledColumn _biometricEnabled;
  final BiometricAuthenticator _bioAuthenticator;

  @override
  Future<bool> hasPin() async => (await _pinHash.read()) != null;

  @override
  Future<void> savePin(String pin) async {
    final salt = _generateSalt();
    await _pinSalt.set(salt);
    await _pinHash.set(_hash(pin, salt));
  }

  @override
  Future<bool> verifyPin(String pin) async {
    final salt = await _pinSalt.read();
    final storedHash = await _pinHash.read();
    if (salt == null || storedHash == null) return false;
    return _hash(pin, salt) == storedHash;
  }

  @override
  Future<bool> canUseBiometric() async {
    final available = await _bioAuthenticator.canCheckBiometrics;
    final supported = await _bioAuthenticator.isDeviceSupported();
    return available && supported;
  }

  @override
  Future<void> enableBiometric() => _biometricEnabled.set('true');

  @override
  Future<bool> isBiometricEnabled() async => (await _biometricEnabled.read()) == 'true';

  @override
  Future<bool> authenticateWithBiometric() =>
      _bioAuthenticator.authenticate(localizedReason: 'Войдите для доступа к CV-Scan');

  String _generateSalt() {
    final bytes = Uint8List(16);
    final random = Random.secure();
    for (var i = 0; i < bytes.length; i++) {
      bytes[i] = random.nextInt(256);
    }
    return base64Encode(bytes);
  }

  String _hash(String pin, String salt) {
    final bytes = utf8.encode(pin + salt);
    return sha256.convert(bytes).toString();
  }

  @override
  Future<void> clear() => Future.wait([_pinHash.remove(), _pinSalt.remove(), _biometricEnabled.remove()]);
}
