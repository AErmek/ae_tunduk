// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'candidate.dart';

part 'conflict.g.dart';

@JsonSerializable()
class Conflict {
  const Conflict({
    required this.code,
    required this.id,
    required this.currentVersion,
    required this.current,
  });

  factory Conflict.fromJson(Map<String, Object?> json) =>
      _$ConflictFromJson(json);

  final String code;
  final String id;
  final int currentVersion;
  final Candidate current;

  Map<String, Object?> toJson() => _$ConflictToJson(this);
}
