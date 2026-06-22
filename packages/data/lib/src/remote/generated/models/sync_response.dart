// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'candidate.dart';
import 'conflict.dart';

part 'sync_response.g.dart';

@JsonSerializable()
class SyncResponse {
  const SyncResponse({
    required this.applied,
    required this.conflicts,
  });

  factory SyncResponse.fromJson(Map<String, Object?> json) =>
      _$SyncResponseFromJson(json);

  final List<Candidate> applied;
  final List<Conflict> conflicts;

  Map<String, Object?> toJson() => _$SyncResponseToJson(this);
}
