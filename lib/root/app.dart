import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:core/flavor_config.dart';
import 'package:navigation/route/routes.dart';
import 'package:core/common/utils/size_config.dart';

import 'config.dart';
import 'custom_theme.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'SGS Warrior',
        debugShowCheckedModeBanner:
            FlavorConfig.instance.env == Environment.DEV,
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        themeMode: currentTheme.currentTheme,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routerDelegate: AppRouter.router.routerDelegate,
        builder: (context, child) {
          SizeConfigs().init(context);
          child = EasyLoading.init()(context, child);
          return child;
        });
  }
}
