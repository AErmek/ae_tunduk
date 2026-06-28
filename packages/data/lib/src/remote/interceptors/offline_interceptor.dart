import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:dio/dio.dart';

/// Rejects requests when there is no real internet, before the mock runs.
class OfflineInterceptor extends Interceptor {
  OfflineInterceptor(this._monitor);

  final NetworkMonitor _monitor;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!_monitor.isOnline) {
      handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
          error: 'No internet connection',
        ),
      );
      return;
    }
    handler.next(options);
  }
}
