// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conflict.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conflict _$ConflictFromJson(Map<String, dynamic> json) => Conflict(
  code: json['code'] as String,
  id: json['id'] as String,
  currentVersion: (json['currentVersion'] as num).toInt(),
  current: Candidate.fromJson(json['current'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ConflictToJson(Conflict instance) => <String, dynamic>{
  'code': instance.code,
  'id': instance.id,
  'currentVersion': instance.currentVersion,
  'current': instance.current,
};
