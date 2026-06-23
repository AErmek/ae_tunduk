import 'dart:math';

import 'package:dio/dio.dart';

/// Simulates network latency in the 300–800ms range.
class LatencyInterceptor extends Interceptor {
  LatencyInterceptor({this.minMs = 300, this.maxMs = 800, Random? random})
      : _random = random ?? Random();

  final int minMs;
  final int maxMs;
  final Random _random;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final ms = minMs + _random.nextInt(maxMs - minMs);
    await Future.delayed(Duration(milliseconds: ms));
    handler.next(options);
  }
}
