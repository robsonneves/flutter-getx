import 'package:flutter_getx/src/pages/base_screen.dart';
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
  ];
}

abstract class PagesRoutes {
  static const String signinRoute = '/signinscreen';
  static const String signupRoute = '/signupscreen';
  static const String baseRoute = '/';
}
