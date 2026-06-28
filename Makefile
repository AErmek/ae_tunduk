
openapi-generate-data:
	cd packages/data && dart run openapi_retrofit_generator && dart run build_runner build --delete-conflicting-outputs

drift-generate:
	cd packages/data && fvm flutter pub run build_runner build --delete-conflicting-outputs

localize:
	cd packages/ui_kit && fvm dart run intl_utils:generate

gen-ui-kit:
	cd packages/ui_kit && fvm flutter pub run build_runner build --delete-conflicting-outputs

gen-app:
	cd app &&fvm flutter pub run build_runner build --delete-conflicting-outputs

gen-shared:
	cd packages/features/shared && fvm flutter pub run build_runner build --delete-conflicting-outputs

gen-pigeon:
	cd plugins/secure_storage && fvm dart run pigeon --input pigeons/secure_storage_api.dart

# Deep link testing. Override host/id: make deeplink-android ID=42
DEEPLINK_HOST ?= cvscan.ae.kg
ID ?= 1

deeplink-android:
	adb shell am start -a android.intent.action.VIEW \
		-d "https://$(DEEPLINK_HOST)/candidates/$(ID)" kg.ae.cv_scan

deeplink-ios:
	xcrun simctl openurl booted "https://$(DEEPLINK_HOST)/candidates/$(ID)"


# ── Release builds with obfuscation ──
# Dart code is obfuscated (--obfuscate) and the symbol map is written to
# app/build/symbols/<flavor>. KEEP these symbols: they are required to
# de-obfuscate (symbolicate) stack traces from release crashes.
SYMBOLS_DIR ?= build/symbols

build-android-apk-stage:
	cd app && fvm flutter build apk --release \
		--flavor stage --dart-define-from-file=config/stage.json \
		--obfuscate --split-debug-info=$(SYMBOLS_DIR)/stage

build-android-apk-prod:
	cd app && fvm flutter build apk --release \
		--flavor prod --dart-define-from-file=config/prod.json \
		--obfuscate --split-debug-info=$(SYMBOLS_DIR)/prod

build-android-bundle-prod:
	cd app && fvm flutter build appbundle --release \
		--flavor prod --dart-define-from-file=config/prod.json \
		--obfuscate --split-debug-info=$(SYMBOLS_DIR)/prod

build-ios-prod:
	cd app && fvm flutter build ipa --release \
		--flavor prod --dart-define-from-file=config/prod.json \
		--obfuscate --split-debug-info=$(SYMBOLS_DIR)/prod