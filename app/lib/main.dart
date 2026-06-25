import 'package:cv_scan_app/src/di/injection.dart';
import 'package:cv_scan_app/src/view/root_context.dart';
import 'package:flutter/widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const RootContext());
}
