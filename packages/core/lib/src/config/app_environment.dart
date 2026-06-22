enum AppEnvironment {
  dev,
  stage,
  prod;

  static AppEnvironment fromString(String value) => switch (value) {
    'dev' => AppEnvironment.dev,
    'stage' => AppEnvironment.stage,
    'prod' => AppEnvironment.prod,
    _ => AppEnvironment.dev,
  };
}
