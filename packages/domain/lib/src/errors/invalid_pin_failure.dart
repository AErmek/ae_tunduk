import 'package:cv_scan_core/cv_scan_core.dart';

/// Entered PIN does not match the stored one.
class InvalidPinFailure implements Failure {
  const InvalidPinFailure([this.message = 'Неверный PIN']);

  @override
  final String message;
}
