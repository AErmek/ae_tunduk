import 'package:cv_scan_data/src/local/database/app_database.dart';
import 'package:cv_scan_data/src/local/database/tables/candidates_table.dart';
import 'package:drift/drift.dart';

part 'candidates_dao.g.dart';

@DriftAccessor(tables: [CandidatesTable])
class CandidatesDao extends DatabaseAccessor<AppDatabase> with _$CandidatesDaoMixin {
  CandidatesDao(super.db);

  Stream<List<CandidatesTableData>> watchAll() => select(candidatesTable).watch();

  Stream<CandidatesTableData?> watchById(String id) =>
      (select(candidatesTable)..where((t) => t.id.equals(id))).watchSingleOrNull();

  Future<List<CandidatesTableData>> getAll() => select(candidatesTable).get();

  Future<void> upsertAll(List<CandidatesTableCompanion> rows) =>
      batch((b) => b.insertAllOnConflictUpdate(candidatesTable, rows));

  Future<void> upsert(CandidatesTableCompanion row) => into(candidatesTable).insertOnConflictUpdate(row);

  // Future<void> updateStatusAndNote({required CandidateChange change}) =>
  //     (update(candidatesTable)..where((t) => t.id.equals(change.id))).write(
  //       CandidatesTableCompanion(
  //         status: Value(change.status.apiKey),
  //         note: Value(change.note),
  //         version: Value(change.version),
  //       ),
  //     );
}
