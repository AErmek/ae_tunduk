import 'package:cv_scan_core/cv_scan_core.dart';

final class SyncException extends AppException {
  const SyncException(int attempt, String message) : super('Sync failed after $attempt retries: $message');
}
