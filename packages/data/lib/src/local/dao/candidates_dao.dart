import 'package:cv_scan_data/src/local/database/app_database.dart';
import 'package:cv_scan_data/src/local/database/tables/candidates_table.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:drift/drift.dart';

part 'candidates_dao.g.dart';

@DriftAccessor(tables: [CandidatesTable])
class CandidatesDao extends DatabaseAccessor<AppDatabase> with _$CandidatesDaoMixin {
  CandidatesDao(super.db);

  Stream<List<CandidatesTableData>> watchAll() => select(candidatesTable).watch();

  /// Watches the first [limit] rows matching the filters — a growing window
  /// for infinite scroll. Filters use columns the outbox overlay never touches.
  Stream<List<CandidatesTableData>> watchPage({
    required int limit,
    CandidateVerdict? verdict,
    String? query,
    SortField sort = SortField.dateAdded,
  }) {
    final statement = select(candidatesTable);

    if (verdict != null) {
      statement.where((t) => t.verdict.equals(verdict.apiKey));
    }

    final trimmed = query?.trim();
    if (trimmed != null && trimmed.isNotEmpty) {
      statement.where((t) => t.searchIndex.like('%${trimmed.toLowerCase()}%'));
    }

    statement
      ..orderBy([(t) => _ordering(t, sort)])
      ..limit(limit);

    return statement.watch();
  }

  OrderingTerm _ordering(CandidatesTable t, SortField sort) => switch (sort) {
    SortField.name => OrderingTerm.asc(t.name),
    SortField.experience => OrderingTerm.desc(t.totalExp),
    SortField.dateAdded => OrderingTerm.desc(t.dateAdded),
  };

  Stream<CandidatesTableData?> watchById(String id) =>
      (select(candidatesTable)..where((t) => t.id.equals(id))).watchSingleOrNull();

  Future<List<CandidatesTableData>> getAll() => select(candidatesTable).get();

  Future<void> upsertAll(List<CandidatesTableCompanion> rows) =>
      batch((b) => b.insertAllOnConflictUpdate(candidatesTable, rows));

  Future<void> upsert(CandidatesTableCompanion row) => into(candidatesTable).insertOnConflictUpdate(row);

  Future<void> clear() => delete(candidatesTable).go();
}
