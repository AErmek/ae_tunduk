import 'package:dio/dio.dart';

final class MockServerResponseProcessor {
  void notFound(RequestOptions options, RequestInterceptorHandler handler) {
    _reject(options, handler, 404, {'code': 'NOT_FOUND', 'message': 'Not found'});
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

Map<String, dynamic> candidateConflictModel(Object id, Map<String, dynamic> current) {
  return {'code': 'VERSION_CONFLICT', 'id': id, 'currentVersion': current['version'], 'current': current};
}
