import 'package:cv_scan_core/cv_scan_core.dart';

//TODO remove?
final class SyncFailException extends AppException {
  const SyncFailException(int attempt, String message) : super('Sync failed after $attempt retries: $message');
}
