import 'package:drift/drift.dart';

enum OutboxSyncStatus { pending, syncing, failed }

class OutboxTable extends Table {
  @override
  String get tableName => 'outbox';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get candidateId => text().named('candidate_id')();
  IntColumn get baseVersion => integer().named('base_version')();
  TextColumn get status => text().nullable()();
  TextColumn get note => text().nullable()();
  DateTimeColumn get clientUpdatedAt => dateTime().named('client_updated_at')();
  TextColumn get syncStatus =>
      textEnum<OutboxSyncStatus>().named('sync_status').withDefault(Constant(OutboxSyncStatus.pending.name))();
  IntColumn get retryCount => integer().named('retry_count').withDefault(const Constant(0))();
  TextColumn get failedReason => text().named('failed_reason').nullable()();
}
