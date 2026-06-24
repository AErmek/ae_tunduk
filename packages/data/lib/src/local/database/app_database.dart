import 'package:cv_scan_data/src/local/dao/candidates_dao.dart';
import 'package:cv_scan_data/src/local/dao/outbox_dao.dart';
import 'package:cv_scan_data/src/local/database/tables/candidates_table.dart';
import 'package:cv_scan_data/src/local/database/tables/outbox_table.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [CandidatesTable, OutboxTable], daos: [CandidatesDao, OutboxDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase({required String fileName}) : super(driftDatabase(name: fileName));

  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;
}
