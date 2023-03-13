import 'package:auth/features/login/presentation/screens/login_screen.dart';
import 'package:auth/features/otp/presentation/screens/otp_screen.dart';
import 'package:auth/features/pin/presentation/screens/create_pin_screen.dart';
import 'package:auth/features/pin/presentation/screens/pin_screen.dart';
import 'package:auth/features/register/presentation/screens/register_screen.dart';
import 'package:core/common/navigator_key.dart';
import 'package:core/core.dart';

import 'package:flutter/material.dart';
import 'package:home/features/home/presentation/screens/home_screen.dart';
import 'package:intro/features/on_boarding/presentation/screens/on_boarding_screen.dart';
import 'package:intro/features/splash/presentation/screens/splash_screen.dart';
import 'package:product/features/product/presentation/screens/product_screen.dart';
import 'package:product/features/product_card/presentation/screens/product_card_screen.dart';
import 'package:transaction/features/cart/presentation/screens/cart_screen.dart';

import 'not_found_page.dart';

class AppRouter {
  static const root = '/';
  static const splash = 'splash';
  static const onboarding = 'onboarding';
  static const login = 'login';
  static const register = 'register';
  static const registerPin = 'registerPin';
  static const createPin = 'createPin';
  static const registerOtp = 'registerOtp';
  static const loginPin = 'loginPin';
  static const loginOtp = 'loginOtp';
  static const home = 'home';
  static const productSearch = 'product_search';
  static const productCard = 'product_card';
  static const cart = 'cart';

  static MaterialPage _splashScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: SplashScreen(),
      );

  static MaterialPage _onBoardingScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: OnBoardingScreen(),
      );

  // AUTH
  static MaterialPage _loginScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: LoginScreen(),
      );

  static MaterialPage _registerScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: RegisterScreen(),
      );

  static MaterialPage _pinScreenRouteBuilder(
      BuildContext context, GoRouterState state) {
    if (state.queryParams['first_pin'] != null) {
      return MaterialPage(
        key: state.pageKey,
        child: PinScreen(
          pinType: state.queryParams['pin_type']!,
          email: state.queryParams['email']!,
          firstPin: state.queryParams['first_pin']!,
        ),
      );
    } else {
      return MaterialPage(
        key: state.pageKey,
        child: PinScreen(
          pinType: state.queryParams['pin_type']!,
          email: state.queryParams['email']!,
        ),
      );
    }
  }

  static MaterialPage _createPinScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: CreatePinScreen(
          pinType: state.queryParams['pin_type']!,
          email: state.queryParams['email']!,
        ),
      );

  static MaterialPage _otpScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: OTPScreen(
          email: state.queryParams['email']!,
          otpType: state.queryParams['otp_type']!,
        ),
      );

  // HOME
  static MaterialPage _homeScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: HomeScreen(),
      );

  static MaterialPage _productSearchScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: ProductScreen(
          warehouseId: state.queryParams['warehouse_id']!,
          warehouseName: state.queryParams['warehouse_name']!,
        ),
      );

  static MaterialPage _productCardScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: ProductCardSceen(
          productName: state.queryParams['product_name']!,
          warehouseId: state.queryParams['warehouse_id']!,
        ),
      );

  // TRANSACTION
  static MaterialPage _cartScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: CartScreen(),
      );

  // ERROR
  static MaterialPage _errorPage(BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: NotFoundPage(),
      );

  static final GoRouter _router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: root,
    routerNeglect: true,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        name: 'splash',
        pageBuilder: _splashScreenRouteBuilder,
      ),
      GoRoute(
        path: '/$registerOtp',
        name: registerOtp,
        pageBuilder: _otpScreenRouteBuilder,
      ),
      GoRoute(
        path: '/$loginOtp',
        name: loginOtp,
        pageBuilder: _otpScreenRouteBuilder,
      ),
      GoRoute(
        path: '/$loginPin',
        name: loginPin,
        pageBuilder: _pinScreenRouteBuilder,
      ),
      GoRoute(
        path: '/$registerPin',
        name: registerPin,
        pageBuilder: _pinScreenRouteBuilder,
      ),
      GoRoute(
        path: '/$createPin',
        name: createPin,
        pageBuilder: _createPinScreenRouteBuilder,
      ),
      GoRoute(
        path: '/$onboarding',
        name: onboarding,
        pageBuilder: _onBoardingScreenRouteBuilder,
        routes: [
          GoRoute(
            path: login,
            name: login,
            pageBuilder: _loginScreenRouteBuilder,
            routes: [
              GoRoute(
                path: register,
                name: register,
                pageBuilder: _registerScreenRouteBuilder,
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/$home',
        name: home,
        pageBuilder: _homeScreenRouteBuilder,
        routes: [
          GoRoute(
            path: productSearch,
            name: productSearch,
            pageBuilder: _productSearchScreenRouteBuilder,
            routes: [
              // GoRoute(
              //   path: productCard,
              //   name: productCard,
              //   pageBuilder: _productCardScreenRouteBuilder,
              //   routes: [],
              // ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/$productCard',
        name: productCard,
        pageBuilder: _productCardScreenRouteBuilder,
        routes: [],
      ),
    ],
    errorPageBuilder: _errorPage,
  );

  static GoRouter get router => _router;
}
