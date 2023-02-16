// import 'package:banner/presentation/pages/banner_page.dart';
import 'package:core/core.dart';

import 'package:flutter/material.dart';
import 'package:intro/features/on_boarding/presentation/screens/on_boarding_screen.dart';
import 'package:intro/features/splash/presentation/screens/splash_screen.dart';

import 'not_found_page.dart';

class AppRouter {
  static const root = '/';
  static const onboarding = 'onboarding';

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

  // static MaterialPage _secondPageRouteBuilder(
  //         BuildContext context, GoRouterState state) =>
  //     MaterialPage(
  //       key: state.pageKey,
  //       child: SecondPage(),
  //     );

  // static MaterialPage _loginPageRouteBuilder(
  //         BuildContext context, GoRouterState state) =>
  //     MaterialPage(
  //       key: state.pageKey,
  //       child: LoginPage(),
  //     );
  //

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
          // GoRoute(path: offer, pageBuilder: _offerPageRouteBuilder),
          // GoRoute(path: offerCard, pageBuilder: _offerCardPageRouteBuilder),
          // GoRoute(path: whatson, pageBuilder: _whatsonPageRouteBuilder),
          // // GoRoute(path: banner, pageBuilder: _bannerPageRouteBuilder),
        ],
      ),
    ],
    errorPageBuilder: _errorPage,
  );

  static GoRouter get router => _router;
}
