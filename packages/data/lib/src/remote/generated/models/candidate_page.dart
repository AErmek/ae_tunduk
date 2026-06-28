// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'candidate.dart';

part 'candidate_page.g.dart';

@JsonSerializable()
class CandidatePage {
  const CandidatePage({
    required this.items,
    required this.page,
    required this.size,
    required this.total,
  });

  factory CandidatePage.fromJson(Map<String, Object?> json) =>
      _$CandidatePageFromJson(json);

  final List<Candidate> items;
  final int page;
  final int size;
  final int total;

  Map<String, Object?> toJson() => _$CandidatePageToJson(this);
}
