import 'package:cv_scan_data/src/local/database/app_database.dart';
import 'package:cv_scan_data/src/local/mappers/candidate_local_mapper.dart';
import 'package:cv_scan_data/src/services/sync/sync_reconciler.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/builders.dart';
import '../../support/dto_builders.dart';

void main() {
  late AppDatabase db;

  SyncReconciler reconciler([ConflictStrategy strategy = ConflictStrategy.serverWins]) =>
      SyncReconciler(db: db, candidatesDao: db.candidatesDao, outboxDao: db.outboxDao, strategy: strategy);

  Future<CandidatesTableData> mirrorRow(String id) => db.candidatesDao.watchById(id).first.then((r) => r!);

  Future<Map<String, OutboxTableData>> pendingByCandidate() async {
    final rows = await db.outboxDao.getPending();
    return {for (final row in rows) row.candidateId: row};
  }

  setUp(() async {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    // Seed the mirror with a known baseline candidate.
    await db.candidatesDao.upsert(candidate(id: 'c1', version: 1, status: CandidateStatus.newCandidate).toCompanion());
  });

  tearDown(() => db.close());

  group('accepted', () {
    test('advances the mirror and drops the outbox row', () async {
      await db.outboxDao.upsertPending(candidateId: 'c1', baseVersion: 1, status: 'invited');

      final pass = await reconciler().reconcile(
        syncResponse(applied: [dtoCandidate(id: 'c1', version: 2, status: 'invited')]),
        await pendingByCandidate(),
      );

      final row = await mirrorRow('c1');
      expect(row.version, 2);
      expect(row.status, 'invited');
      expect(await db.outboxDao.getPending(), isEmpty);
      expect(pass.applied.single.id, 'c1');
      expect(pass.rebased, isFalse);
    });
  });

  group('conflict', () {
    test('serverWins converges to server truth and clears the outbox', () async {
      await db.outboxDao.upsertPending(candidateId: 'c1', baseVersion: 1, status: 'invited', note: 'mine');

      final pass = await reconciler().reconcile(
        syncResponse(conflicts: [dtoConflict(id: 'c1', currentVersion: 5, status: 'review', note: 'theirs')]),
        await pendingByCandidate(),
      );

      final row = await mirrorRow('c1');
      expect(row.version, 5);
      expect(row.status, 'review');
      expect(row.note, 'theirs');
      expect(await db.outboxDao.getPending(), isEmpty);
      expect(pass.rebased, isFalse);
    });

    test('clientWins re-enqueues local intent rebased onto the server version', () async {
      await db.outboxDao.upsertPending(candidateId: 'c1', baseVersion: 1, status: 'invited', note: 'mine');

      final pass = await reconciler(ConflictStrategy.clientWins).reconcile(
        syncResponse(conflicts: [dtoConflict(id: 'c1', currentVersion: 5, status: 'review', note: 'theirs')]),
        await pendingByCandidate(),
      );

      // Mirror still converges to confirmed server truth...
      expect((await mirrorRow('c1')).version, 5);

      // ...but exactly one pending row carries the local intent at the new base.
      final pending = await db.outboxDao.getPending();
      expect(pending, hasLength(1));
      expect(pending.single.baseVersion, 5);
      expect(pending.single.status, 'invited');
      expect(pending.single.note, 'mine');
      expect(pass.rebased, isTrue);
    });
  });

  group('atomicity & idempotency', () {
    test('applies accepted and conflict in the same response consistently', () async {
      await db.candidatesDao.upsert(candidate(id: 'c2', version: 1).toCompanion());
      await db.outboxDao.upsertPending(candidateId: 'c1', baseVersion: 1, status: 'invited');
      await db.outboxDao.upsertPending(candidateId: 'c2', baseVersion: 1, note: 'mine');

      final pass = await reconciler(ConflictStrategy.clientWins).reconcile(
        syncResponse(
          applied: [dtoCandidate(id: 'c1', version: 2, status: 'invited')],
          conflicts: [dtoConflict(id: 'c2', currentVersion: 9, note: 'theirs')],
        ),
        await pendingByCandidate(),
      );

      expect((await mirrorRow('c1')).version, 2);
      expect((await mirrorRow('c2')).version, 9);

      final pending = await db.outboxDao.getPending();
      expect(pending.map((r) => r.candidateId), ['c2']); // c1 cleared, c2 rebased
      expect(pass.applied, hasLength(1));
      expect(pass.conflicts, hasLength(1));
    });

    test('re-applying the same accepted response does not duplicate or resurrect outbox rows', () async {
      await db.outboxDao.upsertPending(candidateId: 'c1', baseVersion: 1, status: 'invited');
      final response = syncResponse(applied: [dtoCandidate(id: 'c1', version: 2, status: 'invited')]);

      await reconciler().reconcile(response, await pendingByCandidate());
      await reconciler().reconcile(response, await pendingByCandidate());

      expect(await db.outboxDao.getPending(), isEmpty);
      expect((await mirrorRow('c1')).version, 2);
    });
  });
}
