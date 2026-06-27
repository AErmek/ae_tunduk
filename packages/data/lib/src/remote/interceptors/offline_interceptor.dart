import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:dio/dio.dart';

/// Simulates the transport layer: with no real internet, reject the request the
/// same way an offline Dio would — before any latency/mock/server logic runs.
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
