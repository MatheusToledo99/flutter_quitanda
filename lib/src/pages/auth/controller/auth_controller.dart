import 'package:get/get.dart';
import 'package:quitanda/src/pages/auth/repository/auth_repository.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();

  Future<void> signInController(
      {required String email, required String password}) async {
    //
    //Simulando o delay para entrar na tela principal.

    isLoading.value = true;

    await authRepository.signIn(email: email, password: password);

    isLoading.value = false;
  }

  Future<void> signUpController({
    required String email,
    required String name,
    required String phone,
    required String cpf,
    required String password,
  }) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
  }
}
