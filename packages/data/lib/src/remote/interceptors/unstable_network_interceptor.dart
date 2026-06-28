import 'dart:math';

import 'package:dio/dio.dart';

/// Randomly fails requests to emulate an unreliable network (~10%).
class UnstableNetworkInterceptor extends Interceptor {
  UnstableNetworkInterceptor({this.failureRate = 0.1, Random? random}) : _random = random ?? Random();

  final double failureRate;
  final Random _random;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_random.nextDouble() < failureRate) {
      handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
          message: 'Simulated network error',
        ),
      );
      return;
    }
    handler.next(options);
  }
}
