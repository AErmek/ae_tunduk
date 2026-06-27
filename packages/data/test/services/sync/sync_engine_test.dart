import 'package:cv_scan_data/src/local/database/app_database.dart';
import 'package:cv_scan_data/src/local/database/tables/outbox_table.dart';
import 'package:cv_scan_data/src/local/mappers/candidate_local_mapper.dart';
import 'package:cv_scan_data/src/remote/generated/api/api_client.dart';
import 'package:cv_scan_data/src/remote/generated/models/sync_request.dart';
import 'package:cv_scan_data/src/remote/generated/models/sync_response.dart';
import 'package:cv_scan_data/src/services/sync/sync_engine_impl.dart';
import 'package:cv_scan_data/src/services/sync/sync_reconciler.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../support/builders.dart';
import '../../support/dto_builders.dart';

class _MockApiClient extends Mock implements ApiClient {}

void main() {
  late AppDatabase db;
  late _MockApiClient api;
  late SyncEngineImpl engine;

  setUpAll(() => registerFallbackValue(const SyncRequest(changes: [])));

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    api = _MockApiClient();
    engine = SyncEngineImpl(
      apiClient: api,
      outboxDao: db.outboxDao,
      reconciler: SyncReconciler(db: db, candidatesDao: db.candidatesDao, outboxDao: db.outboxDao),
    );
  });

  tearDown(() => db.close());

  Future<List<OutboxTableData>> allOutbox() => db.select(db.outboxTable).get();

  void stubPostSync(SyncResponse response) =>
      when(() => api.postSync(body: any(named: 'body'))).thenAnswer((_) async => response);

  DioException dioError(DioExceptionType type) =>
      DioException(requestOptions: RequestOptions(path: '/sync'), type: type);

  test('no-op when the outbox is empty', () async {
    final pass = await engine.runOnce();

    expect(pass.applied, isEmpty);
    expect(pass.rebased, isFalse);
    verifyNever(() => api.postSync(body: any(named: 'body')));
  });

  test('coalesces a candidate\'s edits into a single change', () async {
    await db.candidatesDao.upsert(candidate(id: 'c1', version: 1).toCompanion());
    await db.outboxDao.upsertPending(candidateId: 'c1', baseVersion: 1, status: 'invited');
    await db.outboxDao.upsertPending(candidateId: 'c1', baseVersion: 1, note: 'mine');
    stubPostSync(syncResponse(applied: [dtoCandidate(id: 'c1', version: 2, status: 'invited')]));

    await engine.runOnce();

    final captured = verify(() => api.postSync(body: captureAny(named: 'body'))).captured.single as SyncRequest;
    expect(captured.changes, hasLength(1));
    expect(captured.changes.single.note, 'mine');
  });

  test('applies the accepted response into the mirror and clears the outbox', () async {
    await db.candidatesDao.upsert(candidate(id: 'c1', version: 1).toCompanion());
    await db.outboxDao.upsertPending(candidateId: 'c1', baseVersion: 1, status: 'invited');
    stubPostSync(syncResponse(applied: [dtoCandidate(id: 'c1', version: 2, status: 'invited')]));

    final pass = await engine.runOnce();

    expect(pass.applied.single.id, 'c1');
    expect(await db.outboxDao.getPending(), isEmpty);
  });

  test('a transient error rethrows and leaves the outbox untouched for retry', () async {
    await db.outboxDao.upsertPending(candidateId: 'c1', baseVersion: 1, status: 'invited');
    when(() => api.postSync(body: any(named: 'body'))).thenThrow(dioError(DioExceptionType.connectionError));

    await expectLater(engine.runOnce(), throwsA(isA<DioException>()));

    final pending = await db.outboxDao.getPending();
    expect(pending, hasLength(1)); // still pending, will be replayed
  });

  test('a poisoned (non-transient) change is marked failed and leaves the pending set', () async {
    await db.outboxDao.upsertPending(candidateId: 'c1', baseVersion: 1, status: 'invited');
    when(() => api.postSync(body: any(named: 'body'))).thenThrow(dioError(DioExceptionType.badResponse));

    await expectLater(engine.runOnce(), throwsA(isA<DioException>()));

    expect(await db.outboxDao.getPending(), isEmpty); // out of the pending set
    final all = await allOutbox();
    expect(all.single.syncStatus, OutboxSyncStatus.failed); // but preserved as failed
  });
}
