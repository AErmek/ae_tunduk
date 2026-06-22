// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'sync_request_changes_status_status.dart';

part 'sync_request_changes.g.dart';

@JsonSerializable()
class SyncRequestChanges {
  const SyncRequestChanges({
    required this.id,
    required this.baseVersion,
    this.status,
    this.note,
    this.clientUpdatedAt,
  });

  factory SyncRequestChanges.fromJson(Map<String, Object?> json) =>
      _$SyncRequestChangesFromJson(json);

  final String id;

  /// Версия, на которой основано локальное изменение
  final int baseVersion;
  final SyncRequestChangesStatusStatus? status;
  final String? note;
  final DateTime? clientUpdatedAt;

  Map<String, Object?> toJson() => _$SyncRequestChangesToJson(this);
}
