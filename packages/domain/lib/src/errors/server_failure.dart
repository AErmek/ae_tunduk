import 'package:cv_scan_core/cv_scan_core.dart';

enum ServerFailureCode implements HasApiKey {
  notFound('NOT_FOUND'),
  versionConflict('VERSION_CONFLICT');

  const ServerFailureCode(this.apiKey);

  @override
  final String apiKey;
}

class ServerFailure implements Failure {
  ServerFailure(this.message, {required this.code});

  @override
  final String message;

  final ServerFailureCode code;
}
