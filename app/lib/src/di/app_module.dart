import 'package:cv_scan_data/cv_scan_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @Singleton(order: -1)
  FlutterSecureStorage get secureStorage => createSecureStorage();
}
