import 'package:cv_scan_data/cv_scan_data.dart';

final class PinHashColumn extends SecureStorageColumnString {
  const PinHashColumn({required super.secureStorage}) : super(key: 'pin_hash');
}

final class PinSaltColumn extends SecureStorageColumnString {
  const PinSaltColumn({required super.secureStorage}) : super(key: 'pin_salt');
}

final class BiometricEnabledColumn extends SecureStorageColumnString {
  const BiometricEnabledColumn({required super.secureStorage}) : super(key: 'biometric_enabled');
}
