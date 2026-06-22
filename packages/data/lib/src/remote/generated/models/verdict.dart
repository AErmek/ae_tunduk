// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum Verdict {
  /// Incorrect name has been replaced. Original name: `ПОДХОДИТ`.
  @JsonValue('ПОДХОДИТ')
  undefined0('ПОДХОДИТ'),

  /// Incorrect name has been replaced. Original name: `ЧАСТИЧНО`.
  @JsonValue('ЧАСТИЧНО')
  undefined1('ЧАСТИЧНО'),

  /// Incorrect name has been replaced. Original name: `НЕ ПОДХОДИТ`.
  @JsonValue('НЕ ПОДХОДИТ')
  undefined2('НЕ ПОДХОДИТ'),

  /// Default value for all unparsed values, allows backward compatibility when adding new values on the backend.
  $unknown(null);

  const Verdict(this.json);

  factory Verdict.fromJson(String json) => values.firstWhere(
    (e) => e.json == json,
    orElse: () => $unknown,
  );

  final String? json;

  String toJson() => json ?? 'null';

  @override
  String toString() => json ?? super.toString();

  /// Returns all defined enum values excluding the $unknown value.
  static List<Verdict> get $valuesDefined =>
      values.where((value) => value != $unknown).toList();
}
