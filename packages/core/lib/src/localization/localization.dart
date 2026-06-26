import 'package:cv_scan_core/src/generated/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

export 'package:cv_scan_core/src/generated/l10n/l10n.dart';

extension LocalizationX on BuildContext {
  Translations get t => Translations.of(this);
  //TODO revert then
  // Locale? get locale => SettingsScope.settingsOf(this).locale;
}

typedef S = Translations;

class AppLocaleConfig {
  // static const Map<String, String> languageLabels = { 'ru': 'Русский'};

  static const List<String> _orderedLanguages = ['ru'];

  static bool isSupportedLanguage(String languageCode) =>
      Translations.delegate.supportedLocales.any((locale) => locale.languageCode == languageCode);

  static List<String> get orderedSupportedLanguages => _orderedLanguages.where(isSupportedLanguage).toList();

  static const fallbackLocale = Locale.fromSubtags(languageCode: 'ru');

  static Locale get currentLocale {
    final currentLocale = Intl.getCurrentLocale();
    if (isSupportedLanguage(currentLocale)) {
      return Locale.fromSubtags(languageCode: currentLocale);
    }
    return fallbackLocale;
  }

  static String get currentLanguageCode => currentLocale.languageCode;
}
