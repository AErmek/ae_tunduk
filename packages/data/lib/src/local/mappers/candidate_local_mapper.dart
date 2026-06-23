import 'dart:convert';
import 'dart:isolate';

import 'package:cv_scan_data/src/local/database/app_database.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:drift/drift.dart';

Candidate _mapRow(CandidatesTableData row) => Candidate(
  id: row.id,
  name: row.name,
  position: row.position,
  posLabel: row.posLabel,
  verdict: CandidateVerdict.byApiKey(row.verdict),
  verdictColor: VerdictColor.byApiKey(row.vc),
  status: CandidateStatus.byApiKey(row.status),
  version: row.version,
  file: row.file,
  email: row.email,
  phone: row.phone,
  city: row.city,
  tg: row.tg,
  exp: row.exp != null ? _decodeMatrix(row.exp!) : null,
  totalExp: row.totalExp,
  stack: row.stack,
  edu: row.edu,
  criteria: row.criteria != null ? _decodeMatrix(row.criteria!) : null,
  summary: row.summary,
  questions: row.questions != null ? List<String>.from(jsonDecode(row.questions!) as List) : null,
  note: row.note,
  dateAdded: row.dateAdded,
);

List<List<String>> _decodeMatrix(String json) {
  final outer = jsonDecode(json) as List;
  return outer.map((inner) => List<String>.from(inner as List)).toList();
}

extension CandidateLocalMapper on CandidatesTableData {
  Candidate toDomain() => _mapRow(this);

  CandidateChange toDomainChange() =>
      CandidateChange(id: id, version: version, status: CandidateStatus.byApiKey(status), note: note);
}

extension CandidateCompanionMapper on Candidate {
  CandidatesTableCompanion toCompanion() => CandidatesTableCompanion(
    id: Value(id),
    name: Value(name),
    position: Value(position),
    posLabel: Value(posLabel),
    verdict: Value(verdict.apiKey),
    vc: Value(verdictColor.apiKey),
    status: Value(status.apiKey),
    version: Value(version),
    file: Value(file),
    email: Value(email),
    phone: Value(phone),
    city: Value(city),
    tg: Value(tg),
    exp: Value(exp != null ? jsonEncode(exp) : null),
    totalExp: Value(totalExp),
    stack: Value(stack),
    edu: Value(edu),
    criteria: Value(criteria != null ? jsonEncode(criteria) : null),
    summary: Value(summary),
    questions: Value(questions != null ? jsonEncode(questions) : null),
    note: Value(note),
    dateAdded: Value(dateAdded),
  );
}

Future<List<Candidate>> mapRowsAsync(List<CandidatesTableData> rows) => Isolate.run(() => _mapRows(rows));

List<Candidate> _mapRows(List<CandidatesTableData> rows) => rows.map(_mapRow).toList();
