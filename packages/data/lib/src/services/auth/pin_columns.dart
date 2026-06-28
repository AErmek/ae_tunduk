import 'package:cv_scan_data/src/local/secure_storage/secure_storage_column.dart';

final class PinHashColumn extends SecureStorageColumnString {
  const PinHashColumn({required super.secureStorage}) : super(key: 'pin_hash');
}

final class PinSaltColumn extends SecureStorageColumnString {
  const PinSaltColumn({required super.secureStorage}) : super(key: 'pin_salt');
}

final class BiometricEnabledColumn extends SecureStorageColumnString {
  const BiometricEnabledColumn({required super.secureStorage}) : super(key: 'biometric_enabled');
}
