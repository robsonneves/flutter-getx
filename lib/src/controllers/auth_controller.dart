import 'package:flutter_getx/src/routes/routes.dart';
import 'package:flutter_getx/src/services/auth_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  final AuthService _authService = AuthService();

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    _authService.getAuth(email, password, true).then(
      (value) {
        isLoading.value = false;
        if (value.containsKey('idToken')) {
          Get.offAllNamed(PagesRoutes.baseRoute);
        }
      },
    );
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String cpf,
  }) async {
    // create user email and password
    isLoading.value = true;
    _authService.getAuth(email, password, false).then((value) {
      print(value);
      isLoading.value = false;
    });
  }
}
