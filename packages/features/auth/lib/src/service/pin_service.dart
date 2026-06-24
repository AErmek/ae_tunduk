import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';

class PinService {
  PinService({
    required FlutterSecureStorage secureStorage,
    required LocalAuthentication localAuth,
  })  : _storage = secureStorage,
        _localAuth = localAuth;

  final FlutterSecureStorage _storage;
  final LocalAuthentication _localAuth;

  static const _keyPinHash = 'pin_hash';
  static const _keySalt = 'pin_salt';
  static const _keyBiometric = 'biometric_enabled';

  Future<bool> hasPin() async {
    final hash = await _storage.read(key: _keyPinHash);
    return hash != null;
  }

  Future<void> savePin(String pin) async {
    final salt = _generateSalt();
    final hash = _hash(pin, salt);
    await _storage.write(key: _keySalt, value: salt);
    await _storage.write(key: _keyPinHash, value: hash);
  }

  Future<bool> verifyPin(String pin) async {
    final salt = await _storage.read(key: _keySalt);
    final storedHash = await _storage.read(key: _keyPinHash);
    if (salt == null || storedHash == null) return false;
    return _hash(pin, salt) == storedHash;
  }

  Future<bool> canUseBiometric() async {
    final available = await _localAuth.canCheckBiometrics;
    final supported = await _localAuth.isDeviceSupported();
    return available && supported;
  }

  Future<void> enableBiometric() async {
    await _storage.write(key: _keyBiometric, value: 'true');
  }

  Future<bool> isBiometricEnabled() async {
    final value = await _storage.read(key: _keyBiometric);
    return value == 'true';
  }

  Future<bool> authenticateWithBiometric() async {
    return _localAuth.authenticate(
      localizedReason: 'Войдите для доступа к CV-Scan',
      options: const AuthenticationOptions(biometricOnly: true),
    );
  }

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
}
