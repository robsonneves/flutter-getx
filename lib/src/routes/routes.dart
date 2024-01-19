import 'package:flutter_getx/src/pages/base_screen.dart';
import 'package:flutter_getx/src/pages/calendar.dart';
import 'package:flutter_getx/src/pages/home.dart';
import 'package:flutter_getx/src/pages/sign_in_screen.dart';
import 'package:flutter_getx/src/pages/sign_up_screen.dart';
import 'package:get/get.dart';

abstract class Routes {
  static final pages = <GetPage>[
    GetPage(
      page: () => const BaseScreen(),
      name: PagesRoutes.baseRoute,
    ),
    GetPage(
      page: () => const SignInScreen(),
      name: PagesRoutes.signinRoute,
    ),
    GetPage(
      page: () => SignUpScreen(),
      name: PagesRoutes.signupRoute,
    ),
    GetPage(
      page: () => Home(),
      name: PagesRoutes.homeRoute,
    ),
    GetPage(
      page: () => const Calendar(),
      name: PagesRoutes.calanderRoute,
    ),
  ];
}

abstract class PagesRoutes {
  static const String baseRoute = '/';
  static const String signinRoute = '/signinscreen';
  static const String signupRoute = '/signupscreen';
  static const String homeRoute = '/home';
  static const String calanderRoute = '/calanderRoute';
}
