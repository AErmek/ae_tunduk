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

  /// `Поиск по имени или позиции`
  String get candidatesSearchHint {
    return Intl.message(
      'Поиск по имени или позиции',
      name: 'candidatesSearchHint',
      desc: '',
      args: [],
    );
  }

  /// `Сортировка`
  String get candidatesSortLabel {
    return Intl.message(
      'Сортировка',
      name: 'candidatesSortLabel',
      desc: '',
      args: [],
    );
  }

  /// `По имени`
  String get candidatesSortByName {
    return Intl.message(
      'По имени',
      name: 'candidatesSortByName',
      desc: '',
      args: [],
    );
  }

  /// `По опыту`
  String get candidatesSortByExperience {
    return Intl.message(
      'По опыту',
      name: 'candidatesSortByExperience',
      desc: '',
      args: [],
    );
  }

  /// `По дате добавления`
  String get candidatesSortByDateAdded {
    return Intl.message(
      'По дате добавления',
      name: 'candidatesSortByDateAdded',
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

  /// `Образование`
  String get candidateDetailEducation {
    return Intl.message(
      'Образование',
      name: 'candidateDetailEducation',
      desc: '',
      args: [],
    );
  }

  /// `Резюме`
  String get candidateDetailSummary {
    return Intl.message(
      'Резюме',
      name: 'candidateDetailSummary',
      desc: '',
      args: [],
    );
  }

  /// `Оценка по критериям`
  String get candidateDetailCriteria {
    return Intl.message(
      'Оценка по критериям',
      name: 'candidateDetailCriteria',
      desc: '',
      args: [],
    );
  }

  /// `Вопросы для интервью`
  String get candidateDetailQuestions {
    return Intl.message(
      'Вопросы для интервью',
      name: 'candidateDetailQuestions',
      desc: '',
      args: [],
    );
  }

  /// `Статус`
  String get candidateDetailStatus {
    return Intl.message(
      'Статус',
      name: 'candidateDetailStatus',
      desc: '',
      args: [],
    );
  }

  /// `Заметка`
  String get candidateDetailNote {
    return Intl.message(
      'Заметка',
      name: 'candidateDetailNote',
      desc: '',
      args: [],
    );
  }

  /// `Добавьте заметку о кандидате`
  String get candidateDetailNoteHint {
    return Intl.message(
      'Добавьте заметку о кандидате',
      name: 'candidateDetailNoteHint',
      desc: '',
      args: [],
    );
  }

  /// `Сохранить заметку`
  String get candidateDetailNoteSave {
    return Intl.message(
      'Сохранить заметку',
      name: 'candidateDetailNoteSave',
      desc: '',
      args: [],
    );
  }

  /// `Поделиться`
  String get candidateDetailShare {
    return Intl.message(
      'Поделиться',
      name: 'candidateDetailShare',
      desc: '',
      args: [],
    );
  }

  /// `Не синхронизировано`
  String get candidateDetailNotSynced {
    return Intl.message(
      'Не синхронизировано',
      name: 'candidateDetailNotSynced',
      desc: '',
      args: [],
    );
  }

  /// `Кандидат не найден`
  String get candidateDetailNotFound {
    return Intl.message(
      'Кандидат не найден',
      name: 'candidateDetailNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось сохранить изменение`
  String get candidateDetailSaveError {
    return Intl.message(
      'Не удалось сохранить изменение',
      name: 'candidateDetailSaveError',
      desc: '',
      args: [],
    );
  }

  /// `Новый`
  String get candidateStatusNew {
    return Intl.message(
      'Новый',
      name: 'candidateStatusNew',
      desc: '',
      args: [],
    );
  }

  /// `На рассмотрении`
  String get candidateStatusReview {
    return Intl.message(
      'На рассмотрении',
      name: 'candidateStatusReview',
      desc: '',
      args: [],
    );
  }

  /// `Приглашён`
  String get candidateStatusInvited {
    return Intl.message(
      'Приглашён',
      name: 'candidateStatusInvited',
      desc: '',
      args: [],
    );
  }

  /// `Отклонён`
  String get candidateStatusRejected {
    return Intl.message(
      'Отклонён',
      name: 'candidateStatusRejected',
      desc: '',
      args: [],
    );
  }

  /// `Синхронизация…`
  String get syncInProgress {
    return Intl.message(
      'Синхронизация…',
      name: 'syncInProgress',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка синхронизации`
  String get syncFailed {
    return Intl.message(
      'Ошибка синхронизации',
      name: 'syncFailed',
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

  /// `{CandidateVerdict, select, fits{Подходит} partial{Частично} doesNotFit{Не подходит} other{Неизвестно}}`
  String verdictDisplayName(String CandidateVerdict) {
    return Intl.select(
      CandidateVerdict,
      {
        'fits': 'Подходит',
        'partial': 'Частично',
        'doesNotFit': 'Не подходит',
        'other': 'Неизвестно',
      },
      name: 'verdictDisplayName',
      desc: 'Localized message based on candidate verdict enum',
      args: [CandidateVerdict],
    );
  }

  /// `{CandidateStatus, select, newCandidate{Новый} review{На рассмотрении} invited{Приглашён} rejected{Отклонён} other{Неизвестно}}`
  String candidateStatusDisplayName(String CandidateStatus) {
    return Intl.select(
      CandidateStatus,
      {
        'newCandidate': 'Новый',
        'review': 'На рассмотрении',
        'invited': 'Приглашён',
        'rejected': 'Отклонён',
        'other': 'Неизвестно',
      },
      name: 'candidateStatusDisplayName',
      desc: 'Localized message based on candidate status enum',
      args: [CandidateStatus],
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
