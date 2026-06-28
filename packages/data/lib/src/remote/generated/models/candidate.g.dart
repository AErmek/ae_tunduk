// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Candidate _$CandidateFromJson(Map<String, dynamic> json) => Candidate(
  id: json['id'] as String,
  name: json['name'] as String,
  position: json['position'] as String,
  posLabel: json['pos_label'] as String,
  verdict: CandidateVerdictVerdict.fromJson(json['verdict'] as String),
  vc: CandidateVcVc.fromJson(json['vc'] as String),
  status: CandidateStatusStatus.fromJson(json['status'] as String),
  version: (json['version'] as num).toInt(),
  file: json['file'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  city: json['city'] as String?,
  tg: json['tg'] as String?,
  exp: (json['exp'] as List<dynamic>?)
      ?.map((e) => (e as List<dynamic>).map((e) => e as String).toList())
      .toList(),
  totalExp: json['total_exp'] as String?,
  stack: json['stack'] as String?,
  edu: json['edu'] as String?,
  criteria: (json['criteria'] as List<dynamic>?)
      ?.map((e) => (e as List<dynamic>).map((e) => e as String).toList())
      .toList(),
  summary: json['summary'] as String?,
  questions: (json['questions'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  note: json['note'] as String?,
  dateAdded: json['date_added'] == null
      ? null
      : DateTime.parse(json['date_added'] as String),
);

Map<String, dynamic> _$CandidateToJson(Candidate instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'position': instance.position,
  'pos_label': instance.posLabel,
  'file': instance.file,
  'email': instance.email,
  'phone': instance.phone,
  'city': instance.city,
  'tg': instance.tg,
  'exp': instance.exp,
  'total_exp': instance.totalExp,
  'stack': instance.stack,
  'edu': instance.edu,
  'verdict': instance.verdict.toJson(),
  'vc': instance.vc.toJson(),
  'criteria': instance.criteria,
  'summary': instance.summary,
  'questions': instance.questions,
  'status': instance.status.toJson(),
  'note': instance.note,
  'version': instance.version,
  'date_added': instance.dateAdded?.toIso8601String(),
};
