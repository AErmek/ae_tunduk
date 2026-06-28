import 'package:cv_scan_core/cv_scan_core.dart';

/// Fallback for errors that don't map to a known failure.
class UnknownFailure implements Failure {
  const UnknownFailure([this.message = 'Что-то пошло не так']);

  @override
  final String message;
}
