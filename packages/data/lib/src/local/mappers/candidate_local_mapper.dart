import 'dart:convert';
import 'dart:isolate';

import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:cv_scan_data/src/local/database/app_database.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';

Candidate _mapRow(CandidatesTableData row) {
  return Candidate(
    id: row.id,
    name: row.name,
    position: row.position,
    posLabel: row.posLabel,
    verdict: _mapVerdict(row.verdict),
    verdictColor: _mapVerdictColor(row.vc),
    status: _mapStatus(row.status),
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
    questions: row.questions != null ? List<String>.from(jsonDecode(row.questions!)) : null,
    note: row.note,
    dateAdded: row.dateAdded,
  );
}

List<List<String>> _decodeMatrix(String json) {
  final outer = jsonDecode(json) as List;
  return outer.map((inner) => List<String>.from(inner as List)).toList();
}

CandidateVerdict _mapVerdict(String value) =>
    CandidateVerdict.values.byApiKeyOrDefault(value, defaultValue: CandidateVerdict.defaultValue);

VerdictColor _mapVerdictColor(String value) =>
    VerdictColor.values.byApiKeyOrDefault(value, defaultValue: VerdictColor.defaultValue);

CandidateStatus _mapStatus(String value) =>
    CandidateStatus.values.byApiKeyOrDefault(value, defaultValue: CandidateStatus.defaultValue);

extension CandidateLocalMapper on CandidatesTableData {
  Candidate toDomain() => _mapRow(this);
}

Future<List<Candidate>> mapRowsAsync(List<CandidatesTableData> rows) {
  return Isolate.run(() => _mapRows(rows));
}

List<Candidate> _mapRows(List<CandidatesTableData> rows) {
  return rows.map(_mapRow).toList();
}
