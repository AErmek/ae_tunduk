import 'package:flutter_secure_storage/flutter_secure_storage.dart';

FlutterSecureStorage createSecureStorage() =>
    FlutterSecureStorage(aOptions: _getAndroidOptions(), iOptions: _getIOSOptions());

AndroidOptions _getAndroidOptions() => AndroidOptions.defaultOptions;

IOSOptions _getIOSOptions() => const IOSOptions(accessibility: KeychainAccessibility.first_unlock_this_device);
