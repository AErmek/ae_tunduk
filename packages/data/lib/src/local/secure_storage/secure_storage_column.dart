import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:cv_scan_secure_storage/secure_storage.dart';

abstract base class SecureStorageColumn<T extends Object> extends PersistedColumn<T> {
  const SecureStorageColumn({required this.secureStorage, required this.key});

  final SecureStorage secureStorage;

  final String key;
}

base class SecureStorageColumnString extends SecureStorageColumn<String> {
  const SecureStorageColumnString({required super.secureStorage, required super.key});

  @override
  Future<String?> read() => secureStorage.read(key);

  @override
  Future<void> set(String value) => secureStorage.write(key, value);

  @override
  Future<void> remove() => secureStorage.delete(key);
}
