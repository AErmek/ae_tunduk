import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:cv_scan_data/src/remote/interceptors/latency_interceptor.dart';
import 'package:cv_scan_data/src/remote/interceptors/offline_interceptor.dart';
import 'package:cv_scan_data/src/remote/interceptors/unstable_network_interceptor.dart';
import 'package:cv_scan_data/src/remote/mock/mock_server_interceptor.dart';
import 'package:cv_scan_data/src/remote/mock/mock_server_store.dart';
import 'package:cv_scan_data/src/remote/mock/mock_server_store_initializer.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:dio/dio.dart';

class DioFactory {
  const DioFactory._();

  static Dio create({
    required MockServerStore store,
    required MockServerStoreInitializer initializer,
    required NetworkMonitor networkMonitor,
  }) {
    final config = Config.i.api;
    final dio = Dio(
      BaseOptions(
        baseUrl: config.baseUrl,
        connectTimeout: const Duration(milliseconds: ApiConfig.connectTimeoutMs),
        receiveTimeout: const Duration(milliseconds: ApiConfig.receiveTimeoutMs),
      ),
    );

    if (Config.i.env.isNotProduction) {
      dio.interceptors.addAll([
        OfflineInterceptor(networkMonitor),
        UnstableNetworkInterceptor(),
        LatencyInterceptor(),
        MockServerInterceptor(store: store, initializer: initializer),
      ]);
    }

    return dio;
  }
}
