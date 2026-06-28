import 'package:cv_scan_core/cv_scan_core.dart';

final class AppTesting {
  const AppTesting();

  static const String _prefix = 'TESTING';

  static const bool _simulateServerConflict = bool.fromEnvironment(
    '${_prefix}_SIMULATE_SERVER_CONFLICT',
    defaultValue: false,
  );

  bool get simulateServerConflict => testable(_simulateServerConflict);
  bool get canTest => Config.i.env.isNotProduction;

  // ignore: avoid_positional_boolean_parameters
  bool testable(bool exactTesting) => canTest && exactTesting;
}
