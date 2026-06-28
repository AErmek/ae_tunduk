// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_request_changes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncRequestChanges _$SyncRequestChangesFromJson(Map<String, dynamic> json) =>
    SyncRequestChanges(
      id: json['id'] as String,
      baseVersion: (json['baseVersion'] as num).toInt(),
      status: json['status'] == null
          ? null
          : SyncRequestChangesStatusStatus.fromJson(json['status'] as String),
      note: json['note'] as String?,
      clientUpdatedAt: json['clientUpdatedAt'] == null
          ? null
          : DateTime.parse(json['clientUpdatedAt'] as String),
    );

Map<String, dynamic> _$SyncRequestChangesToJson(SyncRequestChanges instance) =>
    <String, dynamic>{
      'id': instance.id,
      'baseVersion': instance.baseVersion,
      'status': instance.status?.toJson(),
      'note': instance.note,
      'clientUpdatedAt': instance.clientUpdatedAt?.toIso8601String(),
    };
