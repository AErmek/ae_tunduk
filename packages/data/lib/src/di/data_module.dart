import 'package:cv_scan_data/src/local/dao/candidates_dao.dart';
import 'package:cv_scan_data/src/local/dao/outbox_dao.dart';
import 'package:cv_scan_data/src/local/database/app_database.dart';
import 'package:cv_scan_data/src/local/secure_storage/meta.dart';
import 'package:cv_scan_data/src/remote/generated/api/api_client.dart';
import 'package:cv_scan_data/src/repositories/auth_repository_impl.dart';
import 'package:cv_scan_data/src/repositories/candidate_repository_impl.dart';
import 'package:cv_scan_data/src/sync/sync_engine.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DataModule {
  @singleton
  FlutterSecureStorage get secureStorage => createSecureStorage();

  @singleton
  CandidatesDao candidatesDao(AppDatabase db) => db.candidatesDao;

  @singleton
  OutboxDao outboxDao(AppDatabase db) => db.outboxDao;

  @singleton
  SyncEngine syncEngine(ApiClient apiClient, CandidatesDao candidatesDao, OutboxDao outboxDao) =>
      SyncEngine(apiClient: apiClient, candidatesDao: candidatesDao, outboxDao: outboxDao);

  @Singleton(as: AuthRepository)
  AuthRepositoryImpl authRepository(LocalAuthServices localAuthServices) =>
      AuthRepositoryImpl(pinService: localAuthServices);

  @LazySingleton(as: CandidateRepository)
  CandidateRepositoryImpl candidateRepository(
    ApiClient apiClient,
    CandidatesDao candidatesDao,
    OutboxDao outboxDao,
    SyncEngine syncEngine,
  ) => CandidateRepositoryImpl(
    apiClient: apiClient,
    candidatesDao: candidatesDao,
    outboxDao: outboxDao,
    syncEngine: syncEngine,
  );
}
