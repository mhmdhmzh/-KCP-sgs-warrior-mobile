import 'package:intro/intro_injection.dart' as intro;
import 'package:auth/auth_injection.dart' as auth;

Future<void> init() async {
  await intro.init();
  await auth.init();
}
