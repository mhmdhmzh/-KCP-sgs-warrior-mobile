import 'package:flutter/material.dart';
import '../root/app.dart';
import 'package:core/flavor_config.dart';
import 'main_injection.dart' as injection;
import 'package:core/common/constants.dart' as constants;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlavorConfig(
    env: Environment.DEV,
    loyaltyBaseUrl:
        'https://qa-loyaltyservice.mysuperindo.co.id${constants.API_VERSION}',
    accountBaseUrl:
        'https://qa-accountservice.mysuperindo.co.id${constants.API_VERSION}',
    analyticBaseUrl:
        'https://qa-analyticservice.mysuperindo.co.id${constants.API_VERSION}',
  );

  await injection.init();
  runApp(const App());
}
