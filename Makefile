
codegen:
	fvm flutter pub run build_runner build --delete-conflicting-outputs

openapi-generate-data:
	cd packages/data && dart run openapi_retrofit_generator && dart run build_runner build --delete-conflicting-outputs

drift-generate:
	cd packages/data && fvm flutter pub run build_runner build --delete-conflicting-outputs

get:
	fvm flutter pub get
