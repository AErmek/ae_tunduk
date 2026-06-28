# ADR-0005: Flavors / окружения

## Контекст

Нужны окружения dev/stage/prod с разными конфигами (base URL, ключи, параметры
mock) и раздельной установкой сборок на устройство.

## Решение

- **Android product flavors** `dev` / `stage` / `prod` (dimension `default`) с
  `applicationIdSuffix` (`.dev` / `.stage` / `""`) и разными `app_name` — сборки
  ставятся рядом.
- Конфигурация — через **`--dart-define-from-file=config/<env>.json`**
  (`ENV`, `APP_TITLE`, `BASE_URL`, `SHARE_BASE_URL`, `PIN_CODE_LENGTH`,
  `DB_FILE_NAME`, `MOCK_USE_LARGE_ASSET`, `MOCK_CONFLICT_STRATEGY`).
- Реальные `config/*.json` **в гите не хранятся** (только `*.example.json`);
  секреты не попадают в репозиторий.
- Единая точка входа `app/lib/main.dart` (без `main_dev/stage/prod`); окружение
  задаётся флагами запуска (см. `.vscode/launch.json`).

## Альтернативы

- Отдельные `main_<env>.dart` — отвергнуто в пользу единого main + dart-define.
