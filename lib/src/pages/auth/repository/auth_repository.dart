// ignore_for_file: avoid_print, library_prefixes

import 'package:quitanda/src/constants/endpoints.dart';
import 'package:quitanda/src/models/user_model.dart';
import 'package:quitanda/src/pages/auth/repository/auth_errors.dart'
    as authErrors;
import 'package:quitanda/src/pages/auth/result/auth_result.dart';
import 'package:quitanda/src/services/http_manager.dart';

class AuthRepository {
  //
  final HttpManager _httpManager = HttpManager();

  Future<AuthResult> signIn(
      {required String email, required String password}) async {
    //
    final result = await _httpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        "email": email,
        "password": password,
      },
    );

    if (result['result'] != null) {
      final UserModel objResultadoLogin = UserModel.fromJson(result['result']);
      return AuthResult.success(objResultadoLogin);
    } else {
      return AuthResult.error(authErrors.authErrorsString(result['error']));
    }
  }
}
