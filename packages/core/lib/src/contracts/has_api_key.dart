import 'package:collection/collection.dart';

abstract interface class HasApiKey {
  String get apiKey;
}

extension HasApiKeyX<T extends HasApiKey> on Iterable<T> {
  T? byApiKey(String key) => firstWhereOrNull((e) => e.apiKey == key);

  T byApiKeyOrDefault(String key, {required T defaultValue}) => byApiKey(key) ?? defaultValue;
}
