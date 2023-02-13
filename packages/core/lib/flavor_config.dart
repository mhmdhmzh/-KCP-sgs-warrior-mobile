enum Environment {
  DEV,
  PROD,
}

class FlavorConfig {
  final Environment env;
  final String loyaltyBaseUrl;
  final String accountBaseUrl;
  final String analyticBaseUrl;

  FlavorConfig._internal(
    this.env,
    this.loyaltyBaseUrl,
    this.accountBaseUrl,
    this.analyticBaseUrl,
  );

  static FlavorConfig? _instance;

  static FlavorConfig get instance {
    _instance ??= FlavorConfig(
      env: Environment.DEV,
      loyaltyBaseUrl: '',
      accountBaseUrl: '',
      analyticBaseUrl: '',
    );
    return _instance!;
  }

  factory FlavorConfig({
    required Environment env,
    required String loyaltyBaseUrl,
    required String accountBaseUrl,
    required String analyticBaseUrl,
  }) {
    _instance = FlavorConfig._internal(
        env, loyaltyBaseUrl, accountBaseUrl, analyticBaseUrl);
    return _instance!;
  }
}
