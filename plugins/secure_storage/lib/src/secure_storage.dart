import 'package:flutter/services.dart';

import 'package:cv_scan_secure_storage/src/messages.g.dart';

/// Encrypted key-value storage contract.
///
/// Values are persisted by the platform layer encrypted at rest (Android
/// Keystore-wrapped AES-GCM, iOS Keychain). Implementations never expose
/// ciphertext to callers.
abstract interface class SecureStorage {
  Future<String?> read(String key);

  Future<void> write(String key, String value);

  Future<void> delete(String key);

  Future<void> deleteAll();

  Future<bool> containsKey(String key);
}

/// Thrown when the platform layer fails to satisfy a storage operation.
class SecureStorageException implements Exception {
  const SecureStorageException(this.message, {this.code});

  final String message;
  final String? code;

  @override
  String toString() => 'SecureStorageException(${code ?? '-'}): $message';
}

/// Pigeon-backed [SecureStorage] talking to the native Keystore/Keychain host.
class CvScanSecureStorage implements SecureStorage {
  CvScanSecureStorage({SecureStorageApi? api}) : _api = api ?? SecureStorageApi();

  final SecureStorageApi _api;

  @override
  Future<String?> read(String key) => _guard(() => _api.read(key));

  @override
  Future<void> write(String key, String value) => _guard(() => _api.write(key, value));

  @override
  Future<void> delete(String key) => _guard(() => _api.delete(key));

  @override
  Future<void> deleteAll() => _guard(() => _api.deleteAll());

  @override
  Future<bool> containsKey(String key) => _guard(() => _api.containsKey(key));

  Future<T> _guard<T>(Future<T> Function() operation) async {
    try {
      return await operation();
    } on PlatformException catch (error) {
      throw SecureStorageException(error.message ?? error.code, code: error.code);
    }
  }
}
