import 'package:cv_scan_app/src/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(initializerName: 'init', preferRelativeImports: false, asExtension: true)
Future<void> configureDependencies() async => getIt.init();
