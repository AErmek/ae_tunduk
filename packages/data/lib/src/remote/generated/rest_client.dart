// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart' hide Headers;

import 'api/api_client.dart';

/// CV-Scan Mobile API `v1.0.0`.
///
/// Контракт API для мобильного клиента CV-Scan. Контракт зафиксирован: реализовать строго, не добавляя и не переименовывая поля, не меняя коды ошибок. Оптимистичная блокировка — через поле `version` и заголовок `If-Match`.
///
class RestClient {
  RestClient(
    Dio dio, {
    String? baseUrl,
  }) : _dio = dio,
       _baseUrl = baseUrl;

  final Dio _dio;
  final String? _baseUrl;

  static String get version => '1.0.0';

  ApiClient? _api;

  ApiClient get api => _api ??= ApiClient(_dio, baseUrl: _baseUrl);
}
