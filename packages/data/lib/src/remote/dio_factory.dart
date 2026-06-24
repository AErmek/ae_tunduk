import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:cv_scan_data/src/local/dao/candidates_dao.dart';
import 'package:cv_scan_data/src/remote/interceptors/latency_interceptor.dart';
import 'package:cv_scan_data/src/remote/interceptors/unstable_network_interceptor.dart';
import 'package:cv_scan_data/src/remote/mock/mock_server_interceptor.dart';
import 'package:cv_scan_data/src/remote/mock/mock_server_store.dart';
import 'package:cv_scan_data/src/remote/mock/mock_server_store_initializer.dart';
import 'package:dio/dio.dart';

class DioFactory {
  const DioFactory._();

  static Dio create({required CandidatesDao candidatesDao}) {
    final config = Config.i.api;
    final dio = Dio(
      BaseOptions(
        baseUrl: config.baseUrl,
        connectTimeout: const Duration(milliseconds: ApiConfig.connectTimeoutMs),
        receiveTimeout: const Duration(milliseconds: ApiConfig.receiveTimeoutMs),
      ),
    );

    if (Config.i.env.isNotProduction) {
      final store = MockServerStore();
      final initializer = MockServerStoreInitializer(
        store: store,
        candidatesDao: candidatesDao,
      );
      dio.interceptors.addAll([
        UnstableNetworkInterceptor(),
        LatencyInterceptor(),
        MockServerInterceptor(store: store, initializer: initializer),
      ]);
    }

    return dio;
  }
}
