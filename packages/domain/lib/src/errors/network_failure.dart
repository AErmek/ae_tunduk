import 'package:cv_scan_core/cv_scan_core.dart';

/// No reachable internet — the request never made it to the server.
class NetworkFailure implements Failure {
  const NetworkFailure([this.message = 'Нет подключения к интернету']);

  @override
  final String message;
}
