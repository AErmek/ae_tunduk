// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Translations {
  Translations();

  static Translations? _current;

  static Translations get current {
    assert(
      _current != null,
      'No instance of Translations was loaded. Try to initialize the Translations delegate before accessing Translations.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Translations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Translations();
      Translations._current = instance;

      return instance;
    });
  }

  static Translations of(BuildContext context) {
    final instance = Translations.maybeOf(context);
    assert(
      instance != null,
      'No instance of Translations present in the widget tree. Did you add Translations.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static Translations? maybeOf(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  /// `CV Scan`
  String get appTitle {
    return Intl.message('CV Scan', name: 'appTitle', desc: '', args: []);
  }

  /// `Кандидаты`
  String get navCandidates {
    return Intl.message('Кандидаты', name: 'navCandidates', desc: '', args: []);
  }

  /// `Настройки`
  String get navSettings {
    return Intl.message('Настройки', name: 'navSettings', desc: '', args: []);
  }

  /// `Настройки`
  String get settingsTitle {
    return Intl.message('Настройки', name: 'settingsTitle', desc: '', args: []);
  }

  /// `Выйти`
  String get settingsLogout {
    return Intl.message('Выйти', name: 'settingsLogout', desc: '', args: []);
  }

  /// `Выход`
  String get settingsLogoutConfirmTitle {
    return Intl.message(
      'Выход',
      name: 'settingsLogoutConfirmTitle',
      desc: '',
      args: [],
    );
  }

  /// `Вы уверены, что хотите выйти?`
  String get settingsLogoutConfirmMessage {
    return Intl.message(
      'Вы уверены, что хотите выйти?',
      name: 'settingsLogoutConfirmMessage',
      desc: '',
      args: [],
    );
  }

  /// `Отмена`
  String get settingsLogoutConfirmCancel {
    return Intl.message(
      'Отмена',
      name: 'settingsLogoutConfirmCancel',
      desc: '',
      args: [],
    );
  }

  /// `Выйти`
  String get settingsLogoutConfirmConfirm {
    return Intl.message(
      'Выйти',
      name: 'settingsLogoutConfirmConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Кандидаты`
  String get candidatesTitle {
    return Intl.message(
      'Кандидаты',
      name: 'candidatesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Кандидаты не найдены`
  String get candidatesEmpty {
    return Intl.message(
      'Кандидаты не найдены',
      name: 'candidatesEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Это все кандидаты`
  String get candidatesListNoMoreCandidates {
    return Intl.message(
      'Это все кандидаты',
      name: 'candidatesListNoMoreCandidates',
      desc: '',
      args: [],
    );
  }

  /// `Поиск по имени...`
  String get candidatesSearchHint {
    return Intl.message(
      'Поиск по имени...',
      name: 'candidatesSearchHint',
      desc: '',
      args: [],
    );
  }

  /// `Новый`
  String get candidateVerdictNew {
    return Intl.message(
      'Новый',
      name: 'candidateVerdictNew',
      desc: '',
      args: [],
    );
  }

  /// `В шортлисте`
  String get candidateVerdictShortlisted {
    return Intl.message(
      'В шортлисте',
      name: 'candidateVerdictShortlisted',
      desc: '',
      args: [],
    );
  }

  /// `Отказ`
  String get candidateVerdictRejected {
    return Intl.message(
      'Отказ',
      name: 'candidateVerdictRejected',
      desc: '',
      args: [],
    );
  }

  /// `Принят`
  String get candidateVerdictHired {
    return Intl.message(
      'Принят',
      name: 'candidateVerdictHired',
      desc: '',
      args: [],
    );
  }

  /// `Профиль кандидата`
  String get candidateDetailTitle {
    return Intl.message(
      'Профиль кандидата',
      name: 'candidateDetailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Опыт работы`
  String get candidateDetailExperience {
    return Intl.message(
      'Опыт работы',
      name: 'candidateDetailExperience',
      desc: '',
      args: [],
    );
  }

  /// `Навыки`
  String get candidateDetailSkills {
    return Intl.message(
      'Навыки',
      name: 'candidateDetailSkills',
      desc: '',
      args: [],
    );
  }

  /// `Контакты`
  String get candidateDetailContacts {
    return Intl.message(
      'Контакты',
      name: 'candidateDetailContacts',
      desc: '',
      args: [],
    );
  }

  /// `Что-то пошло не так`
  String get errorGeneral {
    return Intl.message(
      'Что-то пошло не так',
      name: 'errorGeneral',
      desc: '',
      args: [],
    );
  }

  /// `Нет подключения к сети`
  String get errorNetwork {
    return Intl.message(
      'Нет подключения к сети',
      name: 'errorNetwork',
      desc: '',
      args: [],
    );
  }

  /// `Повторить`
  String get errorRetry {
    return Intl.message('Повторить', name: 'errorRetry', desc: '', args: []);
  }

  /// `Введите PIN-код`
  String get authPinTitle {
    return Intl.message(
      'Введите PIN-код',
      name: 'authPinTitle',
      desc: '',
      args: [],
    );
  }

  /// `Для входа в приложение`
  String get authPinSubtitle {
    return Intl.message(
      'Для входа в приложение',
      name: 'authPinSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Войдите с помощью биометрии`
  String get authBiometricPrompt {
    return Intl.message(
      'Войдите с помощью биометрии',
      name: 'authBiometricPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Создайте PIN-код`
  String get createPinTitle {
    return Intl.message(
      'Создайте PIN-код',
      name: 'createPinTitle',
      desc: '',
      args: [],
    );
  }

  /// `Подтвердите PIN-код`
  String get confirmPinTitle {
    return Intl.message(
      'Подтвердите PIN-код',
      name: 'confirmPinTitle',
      desc: '',
      args: [],
    );
  }

  /// `PIN не совпадает, попробуйте снова`
  String get pinMismatchError {
    return Intl.message(
      'PIN не совпадает, попробуйте снова',
      name: 'pinMismatchError',
      desc: '',
      args: [],
    );
  }

  /// `Биометрическая аутентификация`
  String get authBiometricTitle {
    return Intl.message(
      'Биометрическая аутентификация',
      name: 'authBiometricTitle',
      desc: '',
      args: [],
    );
  }

  /// `Использовать биометрию для входа?`
  String get authBiometricSubtitle {
    return Intl.message(
      'Использовать биометрию для входа?',
      name: 'authBiometricSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Да`
  String get yes {
    return Intl.message('Да', name: 'yes', desc: '', args: []);
  }

  /// `Нет`
  String get no {
    return Intl.message('Нет', name: 'no', desc: '', args: []);
  }

  /// `Нет сети — показаны сохранённые данные`
  String get noNetworkShownSavedData {
    return Intl.message(
      'Нет сети — показаны сохранённые данные',
      name: 'noNetworkShownSavedData',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Translations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'ru')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Translations> load(Locale locale) => Translations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
