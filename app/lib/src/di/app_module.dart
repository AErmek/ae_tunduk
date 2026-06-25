import 'package:cv_scan_data/cv_scan_data.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @singleton
  AppDatabase get database => DatabaseFactory.create();

  @singleton
  Dio dio(CandidatesDao candidatesDao) => DioFactory.create(candidatesDao: candidatesDao);

  @singleton
  ApiClient apiClient(Dio dio) => ApiClient(dio);
}
