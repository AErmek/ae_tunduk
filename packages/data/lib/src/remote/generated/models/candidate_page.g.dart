// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CandidatePage _$CandidatePageFromJson(Map<String, dynamic> json) =>
    CandidatePage(
      items: (json['items'] as List<dynamic>)
          .map((e) => Candidate.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$CandidatePageToJson(CandidatePage instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'page': instance.page,
      'size': instance.size,
      'total': instance.total,
    };
