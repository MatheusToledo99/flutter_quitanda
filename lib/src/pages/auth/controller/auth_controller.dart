// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:quitanda/src/models/user/user_model.dart';
import 'package:quitanda/src/pages/auth/repository/auth_repository.dart';
import 'package:quitanda/src/pages/auth/result/auth_result.dart';
import 'package:quitanda/src/pages_routes/app_pages.dart';
import 'package:quitanda/src/services/util_services.dart';

class AuthController extends GetxController {
  //                                                                           //
  //                                                                           //
  //                                                                           //
  //--------------------------------- VARIÁVEIS -------------------------------//
  //                                                                           //
  //                                                                           //
  //                                                                           //

  RxBool isLoading = false.obs;
  final authRepository = AuthRepository();
  final utilsServices = UtilsServices();
  UserModel user = UserModel();

  //                                                                           //
  //                                                                           //
  //                                                                           //
  //--------------------------------- MÉTODOS ---------------------------------//
  //                                                                           //
  //                                                                           //
  //                                                                           //

  @override
  void onInit() {
    super.onInit();

    validateTokenController();
  }

  Future<void> signInController(
      {required String email, required String password}) async {
    isLoading.value = true;

    AuthResult result =
        await authRepository.signIn(email: email, password: password);

    isLoading.value = false;

    result.when(success: (user) {
      utilsServices.showToast(message: 'Login efetuado com sucesso!');
      this.user = user;

      //Salvar o token e depois que navegamos a tela base
      utilsServices.saveLocalData(key: 'token', value: user.token!);
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

  Future<void> resetPasswordController(String email) async {
    await authRepository.resetPassword(email);
  }

  Future<void> signOut() async {
    user = UserModel();
    await utilsServices.deleteAllLocalData();
    Get.offAllNamed(PagesRoutes.signInRoute);
  }

  Future<void> changePasswordController(
      {required String newPassword, required String currentPassword}) async {
    isLoading.value = true;

    final result = await authRepository.changePassword(
      email: user.email!,
      currentPassword: currentPassword,
      newPassword: newPassword,
      token: user.token!,
    );

    isLoading.value = false;

    if (result) {
      utilsServices.showToast(
          message: 'Senha alterada com sucesso, entre novamente');
      signOut();
    } else {
      utilsServices.showToast(message: 'Sua Senha Atual está errada');
    }
  }

  Future<void> validateTokenController() async {
    String? token = await utilsServices.getLocalData(key: 'token');

    if (token == null) {
      Get.offAllNamed(PagesRoutes.signInRoute);
    } else {
      final AuthResult result = await authRepository.validateToken(token);

      result.when(
        success: (user) {
          this.user = user;
          utilsServices.saveLocalData(key: 'token', value: user.token!);
          Get.offAllNamed(PagesRoutes.baseRoute);
        },
        error: (message) {
          utilsServices.showToast(message: message, isError: true);
        },
      );
    }
  }
}
