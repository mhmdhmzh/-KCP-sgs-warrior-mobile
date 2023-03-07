import 'package:intro/intro_injection.dart' as intro;
import 'package:auth/auth_injection.dart' as auth;
import 'package:core/core_injection.dart' as core;
import 'package:product/product_injection.dart' as product;

Future<void> init() async {
  await core.init();
  await intro.init();
  await auth.init();
  await product.init();
}
