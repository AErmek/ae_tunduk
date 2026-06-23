import 'package:drift/drift.dart';

class CandidatesTable extends Table {
  @override
  String get tableName => 'candidates';

  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get position => text()();
  TextColumn get posLabel => text().named('pos_label')();
  TextColumn get verdict => text()();
  TextColumn get vc => text()();
  TextColumn get status => text()();
  IntColumn get version => integer()();
  TextColumn get file => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get city => text().nullable()();
  TextColumn get tg => text().nullable()();
  TextColumn get exp => text().nullable()(); // JSON encoded
  TextColumn get totalExp => text().named('total_exp').nullable()();
  TextColumn get stack => text().nullable()();
  TextColumn get edu => text().nullable()();
  TextColumn get criteria => text().nullable()(); // JSON encoded
  TextColumn get summary => text().nullable()();
  TextColumn get questions => text().nullable()(); // JSON encoded
  TextColumn get note => text().nullable()();
  DateTimeColumn get dateAdded => dateTime().named('date_added').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
