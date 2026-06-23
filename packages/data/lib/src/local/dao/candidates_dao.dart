import 'package:drift/drift.dart';

import 'package:cv_scan_data/src/local/database/app_database.dart';
import 'package:cv_scan_data/src/local/database/tables/candidates_table.dart';

part 'candidates_dao.g.dart';

@DriftAccessor(tables: [CandidatesTable])
class CandidatesDao extends DatabaseAccessor<AppDatabase>
    with _$CandidatesDaoMixin {
  CandidatesDao(super.db);

  Stream<List<CandidatesTableData>> watchAll() =>
      select(candidatesTable).watch();

  Stream<CandidatesTableData?> watchById(String id) =>
      (select(candidatesTable)..where((t) => t.id.equals(id)))
          .watchSingleOrNull();

  Future<List<CandidatesTableData>> getAll() =>
      select(candidatesTable).get();

  Future<void> upsertAll(List<CandidatesTableCompanion> rows) =>
      batch((b) => b.insertAllOnConflictUpdate(candidatesTable, rows));

  Future<void> upsert(CandidatesTableCompanion row) =>
      into(candidatesTable).insertOnConflictUpdate(row);

  Future<void> updateStatusAndNote({
    required String id,
    required String status,
    String? note,
    required int version,
  }) =>
      (update(candidatesTable)..where((t) => t.id.equals(id))).write(
        CandidatesTableCompanion(
          status: Value(status),
          note: Value(note),
          version: Value(version),
        ),
      );
}
