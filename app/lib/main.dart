import 'package:cv_scan_app/src/app.dart';
import 'package:cv_scan_app/src/di/injection.dart';
import 'package:flutter/widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const CvScanApp());
}
