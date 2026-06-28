// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidates_dao.dart';

// ignore_for_file: type=lint
mixin _$CandidatesDaoMixin on DatabaseAccessor<AppDatabase> {
  $CandidatesTableTable get candidatesTable => attachedDatabase.candidatesTable;
  CandidatesDaoManager get managers => CandidatesDaoManager(this);
}

class CandidatesDaoManager {
  final _$CandidatesDaoMixin _db;
  CandidatesDaoManager(this._db);
  $$CandidatesTableTableTableManager get candidatesTable =>
      $$CandidatesTableTableTableManager(
        _db.attachedDatabase,
        _db.candidatesTable,
      );
}
