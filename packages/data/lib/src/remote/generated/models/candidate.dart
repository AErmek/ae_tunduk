// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'candidate_status_status.dart';
import 'candidate_vc_vc.dart';
import 'candidate_verdict_verdict.dart';

part 'candidate.g.dart';

@JsonSerializable()
class Candidate {
  const Candidate({
    required this.id,
    required this.name,
    required this.position,
    required this.posLabel,
    required this.verdict,
    required this.vc,
    required this.status,
    required this.version,
    this.file,
    this.email,
    this.phone,
    this.city,
    this.tg,
    this.exp,
    this.totalExp,
    this.stack,
    this.edu,
    this.criteria,
    this.summary,
    this.questions,
    this.note,
    this.dateAdded,
  });

  factory Candidate.fromJson(Map<String, Object?> json) =>
      _$CandidateFromJson(json);

  final String id;
  final String name;
  final String position;
  @JsonKey(name: 'pos_label')
  final String posLabel;
  final String? file;
  final String? email;
  final String? phone;
  final String? city;
  final String? tg;
  final List<List<String>>? exp;
  @JsonKey(name: 'total_exp')
  final String? totalExp;
  final String? stack;
  final String? edu;
  final CandidateVerdictVerdict verdict;
  final CandidateVcVc vc;
  final List<List<String>>? criteria;
  final String? summary;
  final List<String>? questions;
  final CandidateStatusStatus status;
  final String? note;

  /// Версия для оптимистичной блокировки
  final int version;
  @JsonKey(name: 'date_added')
  final DateTime? dateAdded;

  Map<String, Object?> toJson() => _$CandidateToJson(this);
}
