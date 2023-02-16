enum Environment {
  DEV,
  PROD,
}

class FlavorConfig {
  final Environment env;
  final String baseUrl;

  FlavorConfig._internal(
    this.env,
    this.baseUrl,
  );

  static FlavorConfig? _instance;

  static FlavorConfig get instance {
    _instance ??= FlavorConfig(
      env: Environment.DEV,
      baseUrl: '',
    );
    return _instance!;
  }

  factory FlavorConfig({
    required Environment env,
    required String baseUrl,
  }) {
    _instance = FlavorConfig._internal(
      env,
      baseUrl,
    );
    return _instance!;
  }
}
