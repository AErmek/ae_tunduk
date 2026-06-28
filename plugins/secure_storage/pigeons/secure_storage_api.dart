import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/messages.g.dart',
    dartOptions: DartOptions(),
    kotlinOut: 'android/src/main/kotlin/kg/ae/cv_scan/secure_storage/Messages.g.kt',
    kotlinOptions: KotlinOptions(package: 'kg.ae.cv_scan.secure_storage'),
    swiftOut: 'ios/cv_scan_secure_storage/Sources/cv_scan_secure_storage/Messages.g.swift',
    swiftOptions: SwiftOptions(),
    dartPackageName: 'cv_scan_secure_storage',
  ),
)

/// Host API backed by Android Keystore (AES-GCM) and iOS Keychain.
///
/// Every value is encrypted at rest by the platform layer; the Dart side only
/// ever sees plaintext on read and never persists keys itself.
@HostApi()
abstract class SecureStorageApi {
  @async
  String? read(String key);

  @async
  void write(String key, String value);

  @async
  void delete(String key);

  @async
  void deleteAll();

  @async
  bool containsKey(String key);
}
