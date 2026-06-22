// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_patch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CandidatePatch _$CandidatePatchFromJson(Map<String, dynamic> json) =>
    CandidatePatch(
      status: json['status'] == null
          ? null
          : CandidatePatchStatusStatus.fromJson(json['status'] as String),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$CandidatePatchToJson(CandidatePatch instance) =>
    <String, dynamic>{'status': instance.status, 'note': instance.note};
