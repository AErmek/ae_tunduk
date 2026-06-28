# CV-Scan Mobile

Offline-first мобильный клиент платформы скрининга резюме для HR-специалистов:
просмотр кандидатов, смена статусов и заметки работают без сети, изменения
синхронизируются с сервером при восстановлении соединения. Локальная БД — источник
правды для UI.

Проект не в идеальном состоянии, из-за нехватки времени пришлось делать определенные фичи в спешке.

---

## Стек

| Слой | Решение |
|------|---------|
| Архитектура | Clean Architecture + melos-workspace |
| State management | BLoC/Cubit (`flutter_bloc`) |
| Навигация | `go_router` (typed routes, guards, deep links) |
| DI | `get_it` + `injectable` |
| Сеть | `dio` + `retrofit` (по `meta/contract/openapi.yaml`) |
| Модели | `freezed` + `json_serializable` |
| Локальная БД | `drift` |
| Безопасность | свой `MethodChannel` (Keystore/Keychain), `local_auth` |
| Тесты | `flutter_test`, `bloc_test`, `mocktail`, golden, `integration_test` |

---

## Структура

```
app/                         # bootstrap, DI root, навигация, нативный код, flavors
packages/
├── core/                    # pure dart core
├── domain/                  # entities, repository interfaces, usecases, contracts
├── data/                    # модели по контракту, remote+local, sync-движок, mock-сервер, реализации
├── ui_kit/                  # тема, локализация, роутинг utils
└── features/                # auth, candidates_list, candidate_detail, shared
plugins/secure_storage/      # нативный plugin SecureStorage via Pigeon (Keystore/Keychain)
meta/{contract,adr,docs}/    # контракт API, ADR, задание
.github/workflows/ci.yaml    # CI: analyze + test
```

---

## Запуск

Требования: Flutter `3.44.2` (закреплён в `.fvmrc`, рекомендуется [FVM](https://fvm.app)).

```bash
# зависимости + кодогенерация
dart pub global activate melos 7.8.1
flutter pub get                  # резолвит весь workspace из корня
melos run build                  # freezed/json/injectable/retrofit/drift/pigeon/intl

# конфиг окружения (реальные config/*.json в гит не коммитятся)
cp app/config/dev.example.json app/config/dev.json

# запуск (dev / stage / prod)
cd app && fvm flutter run --flavor dev --dart-define-from-file=config/dev.json
```

Тесты и анализ:

```bash
melos run analyze
melos run test          # unit / bloc / widget / golden
melos run test:e2e      # integration_test (E2E)
```

---

## Архитектурные решения

Обоснования и компромиссы — в [ADR](meta/adr/):

- [ADR-0001](meta/adr/0001-modular-architecture-melos.md) — модульность через melos
- [ADR-0002](meta/adr/0002-state-management.md) — выбор BLoC/Cubit
- [ADR-0003](meta/adr/0003-local-database.md) — локальная БД Drift
- [ADR-0004](meta/adr/0004-sync-engine.md) — sync-движок, конфликты по `version`
- [ADR-0005](meta/adr/0005-flavors-environments.md) — flavors / окружения

---

## Обфускация релизных сборок

Релизы обфусцируются (`--obfuscate`) с выгрузкой symbol-map для символизации крашей.
Готовые команды — в `Makefile`:

```bash
make build-android-apk-prod      # prod APK
make build-android-bundle-prod   # prod AAB (Play Store)
make build-ios-prod              # prod IPA
```

Symbol-map пишется в `app/build/symbols/<flavor>` — **сохраняй эти файлы**, без них
стектрейсы из релизных крашей не де-обфусцируются.

Так как проект для тестирования, эти команды могут не выполняться, из-за недонастроек release-ных конфигураций, в Android-е release sign-in-ы нет, в iOS нет привязанной Apple Dev Account.

---

## Производительность

- Список 1000+ кандидатов (`mock/candidates-large.json`) — `ListView.builder` и
  `const`-виджеты, перерисовки сужены через `buildWhen` / `select`.
- Парсинг большого mock-JSON вынесен с UI-потока через `compute`
  (`packages/data/.../mock/mock_server_store_initializer.dart`), UI не фризится.

Системного профилирования (DevTools timeline / `--profile`) не проводил — оценка
плавности только визуальная. Замеры с цифрами — в списке невыполненного.

---

## CI

[.github/workflows/ci.yaml](.github/workflows/ci.yaml) — на pull request в `dev`
(не на прямой push): `pub get` → `melos run analyze` → `melos run test`.

---

## Не реализовано

Сознательно опущено из-за нехватки времени (приоритет был на заданиях 1–3 и 5):

- **BLoC-тесты (`bloc_test`)** — состояния списка/деталей/синхронизации тестами не покрыты
  (`bloc_test` не подключён).
- **E2E (`integration_test`)** — сценарий «офлайн-изменение → синхронизация →
  консистентность» не написан (`melos run test:e2e` сейчас no-op).
- **Golden-тесты** — карточка кандидата и состояния списка (loading/empty/error) не покрыты.
- **Certificate pinning** — не реализован (нет даже заглушки); mock-слой ходит без
  реальной TLS-проверки.
- **Наблюдаемость / сбор сбоев** (Sentry/Crashlytics за интерфейсом) — не подключено.
- **Профилирование производительности** — формальных замеров нет (см. выше).
- **Release-конфигурации сборки** — нет Android release signing и iOS Apple Dev
  Account, поэтому `make build-*` для релизов может не отрабатывать.
