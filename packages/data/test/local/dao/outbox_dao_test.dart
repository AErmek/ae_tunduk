import 'package:cv_scan_data/src/local/database/app_database.dart';
import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;

  setUp(() => db = AppDatabase.forTesting(NativeDatabase.memory()));
  tearDown(() => db.close());

  group('upsertPending', () {
    test('folds a status edit then a note edit into one pending row', () async {
      await db.outboxDao.upsertPending(candidateId: 'c1', baseVersion: 3, status: 'invited');
      await db.outboxDao.upsertPending(candidateId: 'c1', baseVersion: 3, note: 'looks good');

      final pending = await db.outboxDao.getPending();
      expect(pending, hasLength(1));
      expect(pending.single.status, 'invited'); // survived the note edit
      expect(pending.single.note, 'looks good');
      expect(pending.single.baseVersion, 3); // original base preserved
    });

    test('a null field leaves the existing value intact', () async {
      await db.outboxDao.upsertPending(candidateId: 'c1', baseVersion: 1, status: 'review', note: 'first');
      await db.outboxDao.upsertPending(candidateId: 'c1', baseVersion: 1, status: 'invited');

      final pending = await db.outboxDao.getPending();
      expect(pending, hasLength(1));
      expect(pending.single.status, 'invited');
      expect(pending.single.note, 'first');
    });

    test('keeps changes for different candidates separate', () async {
      await db.outboxDao.upsertPending(candidateId: 'c1', baseVersion: 1, status: 'invited');
      await db.outboxDao.upsertPending(candidateId: 'c2', baseVersion: 1, note: 'mine');

      final pending = await db.outboxDao.getPending();
      expect(pending.map((r) => r.candidateId).toSet(), {'c1', 'c2'});
    });

    test('does not merge into a failed row — starts a fresh pending one', () async {
      final id = await db.outboxDao.insert(
        OutboxTableCompanion.insert(
          candidateId: 'c1',
          baseVersion: 1,
          status: const Value('invited'),
          clientUpdatedAt: DateTime.now(),
        ),
      );
      await db.outboxDao.markFailed(id, 'boom');

      await db.outboxDao.upsertPending(candidateId: 'c1', baseVersion: 2, note: 'retry');

      final pending = await db.outboxDao.getPending();
      expect(pending, hasLength(1));
      expect(pending.single.baseVersion, 2);
      expect(pending.single.note, 'retry');
      expect(pending.single.status, isNull); // the failed row's status is not pulled in
    });
  });
}
