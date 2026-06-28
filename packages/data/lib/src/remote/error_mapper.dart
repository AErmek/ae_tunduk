import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:dio/dio.dart';

//TODO recheck
/// Maps Dio errors to domain [Failure]s.
Failure mapDioError(Object error) {
  if (error is! DioException) return const UnknownFailure();

  return switch (error.type) {
    DioExceptionType.connectionError ||
    DioExceptionType.connectionTimeout ||
    DioExceptionType.receiveTimeout ||
    DioExceptionType.sendTimeout => const NetworkFailure(),
    DioExceptionType.badResponse => _fromResponse(error.response),
    _ => const UnknownFailure(),
  };
}

Failure _fromResponse(Response<dynamic>? response) {
  final data = response?.data;
  final code = data is Map<String, dynamic> ? data['code'] as String? : null;
  final message = data is Map<String, dynamic> ? data['message'] as String? : null;

  if (code == ServerFailureCode.versionConflict.apiKey) {
    return ServerFailure(message ?? 'Конфликт версий', code: ServerFailureCode.versionConflict);
  }
  if (code == ServerFailureCode.notFound.apiKey || response?.statusCode == 404) {
    return ServerFailure(message ?? 'Не найдено', code: ServerFailureCode.notFound);
  }
  return const UnknownFailure();
}
