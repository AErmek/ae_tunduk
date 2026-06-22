// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'candidate_patch_status_status.dart';

part 'candidate_patch.g.dart';

@JsonSerializable()
class CandidatePatch {
  const CandidatePatch({
    this.status,
    this.note,
  });

  factory CandidatePatch.fromJson(Map<String, Object?> json) =>
      _$CandidatePatchFromJson(json);

  final CandidatePatchStatusStatus? status;
  final String? note;

  Map<String, Object?> toJson() => _$CandidatePatchToJson(this);
}
