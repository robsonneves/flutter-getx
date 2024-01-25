import 'package:flutter_getx/src/binding/home_binding.dart';
import 'package:flutter_getx/src/pages/base_screen.dart';
import 'package:flutter_getx/src/pages/calendar_screen.dart';
import 'package:flutter_getx/src/pages/day_screen.dart';
import 'package:flutter_getx/src/pages/home_screen.dart';
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
      page: () => SignInScreen(),
      name: PagesRoutes.signinRoute,
    ),
    GetPage(
      page: () => SignUpScreen(),
      name: PagesRoutes.signupRoute,
    ),
    GetPage(
      page: () => HomeScreen(),
      name: PagesRoutes.homeRoute,
      bindings: [
        HomeBiding(),
      ],
    ),
    GetPage(
      page: () => const CalendarScreen(),
      name: PagesRoutes.calanderRoute,
    ),
    GetPage(
      page: () => const DayScreen(),
      name: PagesRoutes.dayRoute,
    ),
  ];
}

abstract class PagesRoutes {
  static const String baseRoute = '/';
  static const String signinRoute = '/signinscreen';
  static const String signupRoute = '/signupscreen';
  static const String homeRoute = '/home';
  static const String calanderRoute = '/calanderRoute';
  static const String dayRoute = '/dayRoute/:day';
}
