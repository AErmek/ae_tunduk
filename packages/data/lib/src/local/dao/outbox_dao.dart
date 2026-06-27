import 'package:cv_scan_data/src/local/database/app_database.dart';
import 'package:cv_scan_data/src/local/database/tables/outbox_table.dart';
import 'package:drift/drift.dart';

part 'outbox_dao.g.dart';

@DriftAccessor(tables: [OutboxTable])
class OutboxDao extends DatabaseAccessor<AppDatabase> with _$OutboxDaoMixin {
  OutboxDao(super.db);

  Stream<List<OutboxTableData>> watchPending() =>
      (select(outboxTable)
            ..where((t) => t.syncStatus.equalsValue(OutboxSyncStatus.pending))
            ..orderBy([(t) => OrderingTerm.asc(t.clientUpdatedAt)]))
          .watch();

  Future<List<OutboxTableData>> getPending() =>
      (select(outboxTable)
            ..where((t) => t.syncStatus.equalsValue(OutboxSyncStatus.pending))
            ..orderBy([(t) => OrderingTerm.asc(t.clientUpdatedAt)]))
          .get();

  Future<int> insert(OutboxTableCompanion row) => into(outboxTable).insert(row);

  Future<void> markSyncing(int id) =>
      (update(outboxTable)..where((t) => t.id.equals(id))).write(
        const OutboxTableCompanion(syncStatus: Value(OutboxSyncStatus.syncing)),
      );

  Future<void> markFailed(int id, String reason) =>
      (update(outboxTable)..where((t) => t.id.equals(id))).write(
        OutboxTableCompanion(
          syncStatus: const Value(OutboxSyncStatus.failed),
          failedReason: Value(reason),
          retryCount: const Value(0),
        ),
      );

  Future<void> incrementRetry(int id) async {
    final row = await (select(outboxTable)..where((t) => t.id.equals(id))).getSingle();
    await (update(outboxTable)..where((t) => t.id.equals(id))).write(
      OutboxTableCompanion(
        syncStatus: const Value(OutboxSyncStatus.pending),
        retryCount: Value(row.retryCount + 1),
      ),
    );
  }

  Future<void> deleteById(int id) =>
      (delete(outboxTable)..where((t) => t.id.equals(id))).go();

  Future<void> deleteForCandidate(String candidateId) =>
      (delete(outboxTable)..where((t) => t.candidateId.equals(candidateId))).go();

  Stream<bool> watchHasPending() => watchPending().map((rows) => rows.isNotEmpty);

  Stream<bool> watchHasPendingForCandidate(String candidateId) =>
      watchPending().map((rows) => rows.any((row) => row.candidateId == candidateId));
}
