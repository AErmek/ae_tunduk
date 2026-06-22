// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:retrofit/error_logger.dart';

import '../models/candidate.dart';
import '../models/candidate_page.dart';
import '../models/candidate_patch.dart';
import '../models/sort.dart';
import '../models/sync_request.dart';
import '../models/sync_response.dart';
import '../models/verdict.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  /// Список кандидатов (пагинация, фильтр, поиск, сортировка).
  ///
  /// [q] - Поиск по ФИО.
  @GET('/candidates')
  Future<CandidatePage> listCandidates({
    @Query('verdict') Verdict? verdict,
    @Query('q') String? q,
    @Query('page') int? page = 0,
    @Query('size') int? size = 10,
    @Query('sort') Sort? sort = Sort.dateAdded,
  });

  /// Карточка кандидата
  @GET('/candidates/{id}')
  Future<Candidate> getCandidate({
    @Path('id') required String id,
  });

  /// Изменение статуса/заметки (оптимистичная блокировка).
  ///
  /// [ifMatch] - Ожидаемая версия ресурса.
  ///
  /// [body] - Name not received - field will be skipped.
  @PATCH('/candidates/{id}')
  Future<Candidate> patchCandidate({
    @Path('id') required String id,
    @Header('If-Match') required int ifMatch,
    @Body() required CandidatePatch body,
  });

  /// Батч-синхронизация офлайн-изменений.
  ///
  /// [body] - Name not received - field will be skipped.
  ///
  /// The name has been replaced because it conflicts with a Dart type. Original name: `sync`.
  @POST('/sync')
  Future<SyncResponse> postSync({
    @Body() required SyncRequest body,
  });
}
