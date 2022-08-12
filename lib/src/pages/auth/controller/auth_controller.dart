// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:quitanda/src/models/user_model.dart';
import 'package:quitanda/src/pages/auth/repository/auth_repository.dart';
import 'package:quitanda/src/pages/auth/result/auth_result.dart';
import 'package:quitanda/src/pages_routes/app_pages.dart';
import 'package:quitanda/src/services/util_services.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();
  final utilsServices = UtilsServices();
  UserModel user = UserModel();

  Future<void> signInController(
      {required String email, required String password}) async {
    isLoading.value = true;

    AuthResult result =
        await authRepository.signIn(email: email, password: password);

    isLoading.value = false;

    result.when(success: (user) {
      utilsServices.showToast(message: 'Login efetuado com sucesso!');
      this.user = user;
      Get.offAllNamed(PagesRoutes.baseRoute);
    }, error: (message) {
      utilsServices.showToast(message: message, isError: true);
    });
  }

  Future<void> signUpController() async {
    isLoading.value = true;

    AuthResult result = await authRepository.signUp(user);

    isLoading.value = false;

    result.when(success: (user) {
      utilsServices.showToast(message: 'Usuário cadastrado com sucesso!');
      this.user = user;
      Get.offAllNamed(PagesRoutes.baseRoute);
    }, error: (message) {
      utilsServices.showToast(message: message, isError: true);
    });
  }
}

  // Future<void> validateTokenController(String token) async {
  //   AuthResult result = await authRepository.validateToken(token);

  //   result.when(success: (user) {
  //     utilsServices.showToast(message: 'Token validado');
  //     Get.offAllNamed(PagesRoutes.baseRoute);
  //   }, error: (message) {
  //     utilsServices.showToast(message: message, isError: true);
  //   });
  // }