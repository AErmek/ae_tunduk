import 'package:cv_scan_app/src/routing/app_router.dart';
import 'package:cv_scan_data/cv_scan_data.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @singleton
  AppDatabase get database => AppDatabase();

  @singleton
  Dio get dio => Dio();

  @singleton
  ApiClient apiClient(Dio dio) => ApiClient(dio);

  @singleton
  GoRouter get router => appRouter;
}
