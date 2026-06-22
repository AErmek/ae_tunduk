openapi-generate-data:
	cd packages/data && dart run openapi_retrofit_generator && dart run build_runner build --delete-conflicting-outputs
