import 'package:cv_scan_core/src/models/failure.dart';

enum ServerFailureCode { notFound, versionConflict }

class ServerFailure implements Failure {
  ServerFailure(this.message, {required this.code});

  @override
  final String message;

  final ServerFailureCode code;
}
