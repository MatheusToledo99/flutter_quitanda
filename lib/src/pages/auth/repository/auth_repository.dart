// ignore_for_file: avoid_print, library_prefixes

import 'package:quitanda/src/constants/endpoints.dart';
import 'package:quitanda/src/models/user/user_model.dart';
import 'package:quitanda/src/pages/auth/repository/auth_errors.dart'
    as authErrors;
import 'package:quitanda/src/pages/auth/result/auth_result.dart';
import 'package:quitanda/src/services/http_manager.dart';

class AuthRepository {
  //
  final HttpManager _httpManager = HttpManager();

  //Método para Logar
  Future<AuthResult> signIn({
    required String email,
    required String password,
  }) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        "email": email,
        "password": password,
      },
    );

    if (result['result'] != null) {
      final UserModel objUser = UserModel.fromJson(result['result']);
      return AuthResult.success(objUser);
    } else {
      return AuthResult.error(authErrors.authErrorsString(result['error']));
    }
  }

  //Método para Cadastro
  Future<AuthResult> signUp(UserModel user) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signup,
      method: HttpMethods.post,
      body: user.toJson(),
    );

    if (result['result'] != null) {
      final UserModel objUser = UserModel.fromJson(result['result']);
      return AuthResult.success(objUser);
    } else {
      return AuthResult.error(authErrors.authErrorsString(result['error']));
    }
  }

  //Método para recuperar a senha enviada no email
  Future<void> resetPassword(String email) async {
    await _httpManager.restRequest(
        url: Endpoints.resetPassword,
        method: HttpMethods.post,
        body: {"email": email});
  }

  //Método para alterar a senha dentro da própria aplicação
  Future<bool> changePassword({
    required String email,
    required String currentPassword,
    required String newPassword,
    required String token,
  }) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.changePassword,
      method: HttpMethods.post,
      body: {
        'email': email,
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      },
      headers: {
        'X-Parse-Session-Token': token,
      },
    );

    return result['error'] == null;
  }

  Future<AuthResult> validateToken(String token) async {
    final result = await _httpManager.restRequest(
        url: Endpoints.validateToken,
        method: HttpMethods.post,
        headers: {
          'X-Parse-Session-Token': token,
        });
    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(authErrors.authErrorsString(result['result']));
    }
  }
}





























  // Future<AuthResult> validateToken(String token) async {
  //   final result = await _httpManager.restRequest(
  //     url: Endpoints.signin,
  //     method: HttpMethods.post,
  //     headers: {"X-Parse-Session-Token": token},
  //   );

  //   if (result['result'] != null) {
  //     final UserModel objUser = UserModel.fromJson(result['result']);
  //     return AuthResult.success(objUser);
  //   } else {
  //     return AuthResult.error(authErrors.authErrorsString(result['error']));
  //   }
  // }
