// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'sync_request_changes.dart';

part 'sync_request.g.dart';

@JsonSerializable()
class SyncRequest {
  const SyncRequest({
    required this.changes,
  });

  factory SyncRequest.fromJson(Map<String, Object?> json) =>
      _$SyncRequestFromJson(json);

  final List<SyncRequestChanges> changes;

  Map<String, Object?> toJson() => _$SyncRequestToJson(this);
}
