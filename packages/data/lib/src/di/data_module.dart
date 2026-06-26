import 'package:cv_scan_data/cv_scan_data.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DataModule {
  @singleton
  FlutterSecureStorage get secureStorage => createSecureStorage();

  @singleton
  AppDatabase get database => DatabaseFactory.create();

  @singleton
  CandidatesDao candidatesDao(AppDatabase db) => db.candidatesDao;

  @singleton
  OutboxDao outboxDao(AppDatabase db) => db.outboxDao;

  @lazySingleton
  Dio dio(CandidatesDao candidatesDao) => DioFactory.create(candidatesDao: candidatesDao);

  @lazySingleton
  ApiClient apiClient(Dio dio) => ApiClient(dio);

  @singleton
  SyncEngine syncEngine(ApiClient apiClient, CandidatesDao candidatesDao, OutboxDao outboxDao) =>
      SyncEngine(apiClient: apiClient, candidatesDao: candidatesDao, outboxDao: outboxDao);

  @LazySingleton(as: CandidateRemoteDataSource)
  CandidateRemoteDataSourceImpl candidateRemoteDataSource(ApiClient apiClient) =>
      CandidateRemoteDataSourceImpl(apiClient: apiClient);

  @LazySingleton(as: CandidateLocalDataSource)
  CandidateLocalDataSourceImpl candidateLocalDataSource(CandidatesDao candidatesDao, OutboxDao outboxDao) =>
      CandidateLocalDataSourceImpl(candidatesDao: candidatesDao, outboxDao: outboxDao);

  @Singleton(as: AuthRepository)
  AuthRepositoryImpl authRepository(LocalAuthService localAuthServices) =>
      AuthRepositoryImpl(pinService: localAuthServices);

  @LazySingleton(as: CandidateRepository)
  CandidateRepositoryImpl candidateRepository(
    CandidateRemoteDataSource remote,
    CandidateLocalDataSource local,
    SyncEngine syncEngine,
  ) => CandidateRepositoryImpl(remote: remote, local: local, syncEngine: syncEngine);
}
