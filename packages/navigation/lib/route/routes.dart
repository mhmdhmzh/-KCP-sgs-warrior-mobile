// import 'package:banner/presentation/pages/banner_page.dart';
import 'package:auth/features/login/presentation/screens/login_screen.dart';
import 'package:auth/features/otp/presentation/screens/otp_screen.dart';
import 'package:auth/features/pin/presentation/screens/pin_screen.dart';
import 'package:auth/features/register/presentation/screens/register_screen.dart';
import 'package:core/core.dart';

import 'package:flutter/material.dart';
import 'package:home/features/home/presentation/screens/home_screen.dart';
import 'package:intro/features/on_boarding/presentation/screens/on_boarding_screen.dart';
import 'package:intro/features/splash/presentation/screens/splash_screen.dart';

import 'not_found_page.dart';

class AppRouter {
  static const root = '/';
  static const onboarding = 'onboarding';
  static const login = 'login';
  static const register = 'register';
  static const pin = 'pin';
  static const otp = 'otp';
  static const home = 'home';

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
  static MaterialPage _homeScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: HomeScreen(),
      );

  static MaterialPage _pinScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: PinScreen(),
      );

  static MaterialPage _otpScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: OTPScreen(
          email: state.extra!,
        ),
      );

  static MaterialPage _errorPage(BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: NotFoundPage(),
      );

  static final GoRouter _router = GoRouter(
    initialLocation: root,
    routes: [
      GoRoute(
        path: root,
        pageBuilder: _splashScreenRouteBuilder,
        routes: [
          GoRoute(path: onboarding, pageBuilder: _onBoardingScreenRouteBuilder),
          GoRoute(path: login, pageBuilder: _loginScreenRouteBuilder),
          GoRoute(path: pin, pageBuilder: _pinScreenRouteBuilder),
          GoRoute(path: otp, pageBuilder: _otpScreenRouteBuilder),
          GoRoute(path: register, pageBuilder: _registerScreenRouteBuilder),
          GoRoute(path: home, pageBuilder: _homeScreenRouteBuilder),
        ],
      ),
    ],
    errorPageBuilder: _errorPage,
  );

  static GoRouter get router => _router;
}
