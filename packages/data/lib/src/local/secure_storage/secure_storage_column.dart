import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract base class SecureStorageColumn<T extends Object> extends PersistedColumn<T> {
  const SecureStorageColumn({required this.secureStorage, required this.key});

  final FlutterSecureStorage secureStorage;

  final String key;
}

base class SecureStorageColumnString extends SecureStorageColumn<String> {
  const SecureStorageColumnString({required super.secureStorage, required super.key});

  @override
  Future<String?> read() => secureStorage.read(key: key);

  @override
  Future<void> set(String value) async {
    await secureStorage.write(key: key, value: value);
  }

  @override
  Future<void> remove() async {
    await secureStorage.delete(key: key);
  }
}
