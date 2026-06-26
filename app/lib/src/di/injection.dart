import 'package:cv_scan_app/src/di/injection.config.dart';
import 'package:cv_scan_data/cv_scan_data.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: false,
  asExtension: true,
  externalPackageModulesAfter: [
    ExternalModule(FeatureAuthPackageModule),
    ExternalModule(CvScanDataPackageModule),
    ExternalModule(CvScanDomainPackageModule),
  ],
)
Future<void> configureDependencies() async => getIt.init();
