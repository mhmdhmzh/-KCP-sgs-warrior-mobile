import 'package:flutter/material.dart';
import '../root/app.dart';
import 'package:core/flavor_config.dart';
import 'main_injection.dart' as injection;
import 'package:core/common/constants.dart' as constants;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlavorConfig(
    env: Environment.PROD,
    baseUrl: '',
  );

  await injection.init();
  runApp(const App());
}
