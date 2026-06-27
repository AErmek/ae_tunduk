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

  /// Folds a status/note edit into the candidate's open change. Edits accumulate
  /// into one pending row (status and note kept independently) against the same
  /// [baseVersion], so partial edits never reset each other. A null field means
  /// "untouched" and leaves the existing value intact. Only a `pending` row is
  /// merged into — `syncing`/`failed` rows are left alone and a new row starts.
  Future<void> upsertPending({
    required String candidateId,
    required int baseVersion,
    String? status,
    String? note,
  }) => transaction(() async {
    final existing =
        await (select(outboxTable)
              ..where((t) => t.candidateId.equals(candidateId) & t.syncStatus.equalsValue(OutboxSyncStatus.pending))
              ..orderBy([(t) => OrderingTerm.desc(t.clientUpdatedAt)])
              ..limit(1))
            .getSingleOrNull();

    if (existing == null) {
      await into(outboxTable).insert(
        OutboxTableCompanion(
          candidateId: Value(candidateId),
          baseVersion: Value(baseVersion),
          status: Value(status),
          note: Value(note),
          clientUpdatedAt: Value(DateTime.now()),
        ),
      );
      return;
    }

    await (update(outboxTable)..where((t) => t.id.equals(existing.id))).write(
      OutboxTableCompanion(
        status: status != null ? Value(status) : const Value.absent(),
        note: note != null ? Value(note) : const Value.absent(),
        clientUpdatedAt: Value(DateTime.now()),
      ),
    );
  });

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
