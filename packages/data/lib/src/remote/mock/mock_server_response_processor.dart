import 'package:cv_scan_data/src/remote/generated/models/error.dart' as dto;
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:dio/dio.dart';

final class MockServerResponseProcessor {
  void notFound(RequestOptions options, RequestInterceptorHandler handler) {
    _reject(options, handler, 404, dto.Error(code: ServerFailureCode.notFound.apiKey, message: 'Not found').toJson());
  }

  void success<T>(RequestOptions options, RequestInterceptorHandler handler, T? data) {
    handler.resolve(Response(requestOptions: options, statusCode: 200, data: data));
  }

  void conflict(RequestOptions options, RequestInterceptorHandler handler, Map<String, dynamic> data) {
    _reject(options, handler, 409, data);
  }

  void _reject(RequestOptions options, RequestInterceptorHandler handler, int statusCode, Map<String, dynamic> data) {
    handler.reject(
      DioException(
        requestOptions: options,
        type: DioExceptionType.badResponse,
        response: Response(requestOptions: options, statusCode: statusCode, data: data),
      ),
    );
  }
}

Map<String, dynamic> candidateConflictModel(dynamic id, Map<String, dynamic> current) => {
  'code': ServerFailureCode.versionConflict.apiKey,
  'id': id,
  'currentVersion': current['version'],
  'current': current,
};
