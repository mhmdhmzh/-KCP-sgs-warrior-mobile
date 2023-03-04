import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigation/route/routes.dart';
import 'package:core/common/constants.dart' as constants;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var token = sl<SharedPreferences>().getString(constants.PREF_KEY_TOKEN);
    var email = sl<SharedPreferences>().getString(constants.PREF_KEY_EMAIL);
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (token != null && email != null) {
        debugPrint('TOKEN: $token');
        debugPrint('EMAIL: $email');
        context.goNamed(AppRouter.loginPin, queryParams: {
          'pin_type': 'login',
          'email': email,
        });
      } else {
        context.goNamed(AppRouter.onboarding);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/background/splash.jpeg',
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
