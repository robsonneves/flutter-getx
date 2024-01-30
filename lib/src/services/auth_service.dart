import 'package:flutter_getx/src/services/http_manager_service.dart';

class AuthService {
  final HttpManagerService _httpManagerService = HttpManagerService();

  Future<Map> getAuth(String email, String password, bool isLogin) async {
    String key = 'AIzaSyD89veToQiudH0Rvit6Vm659CvzNdHuNi8';
    String fragmentUrl = isLogin ? 'signInWithPassword' : 'signUp';
    String url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$fragmentUrl?key=$key';

    Map<dynamic, dynamic> body = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    return await _httpManagerService
        .restRequest(
          url: url,
          method: HttpMethods.post,
          headers: null,
          body: body,
        )
        .then((value) => value);
  }
}
