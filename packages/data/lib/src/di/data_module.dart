import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:cv_scan_data/cv_scan_data.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:cv_scan_secure_storage/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DataModule {
  @singleton
  SecureStorage get secureStorage => createSecureStorage();

  @singleton
  AppDatabase get database => DatabaseFactory.create();

  @singleton
  CandidatesDao candidatesDao(AppDatabase db) => db.candidatesDao;

  @singleton
  OutboxDao outboxDao(AppDatabase db) => db.outboxDao;

  @Singleton(as: NetworkMonitor)
  NetworkMonitorImpl networkMonitor() => NetworkMonitorImpl();

  @lazySingleton
  Dio dio(CandidatesDao candidatesDao, NetworkMonitor networkMonitor) =>
      DioFactory.create(candidatesDao: candidatesDao, networkMonitor: networkMonitor);

  @lazySingleton
  ApiClient apiClient(Dio dio) => ApiClient(dio);

  @lazySingleton
  SyncReconciler syncReconciler(AppDatabase database, CandidatesDao candidatesDao, OutboxDao outboxDao) =>
      SyncReconciler(
        db: database,
        candidatesDao: candidatesDao,
        outboxDao: outboxDao,
        strategy: ConflictStrategy.byName(Config.i.api.mockConflictStrategy),
      );

  @LazySingleton(as: SyncEngine)
  SyncEngineImpl syncEngine(ApiClient apiClient, OutboxDao outboxDao, SyncReconciler reconciler) =>
      SyncEngineImpl(apiClient: apiClient, outboxDao: outboxDao, reconciler: reconciler);

  @Singleton(as: SyncScheduler)
  SyncSchedulerImpl syncScheduler(SyncEngine engine, OutboxDao outboxDao, NetworkMonitor networkMonitor) =>
      SyncSchedulerImpl(engine: engine, outboxDao: outboxDao, networkMonitor: networkMonitor);

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
  CandidateRepositoryImpl candidateRepository(CandidateRemoteDataSource remote, CandidateLocalDataSource local) =>
      CandidateRepositoryImpl(remote: remote, local: local);
}
