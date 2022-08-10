import 'package:get/get.dart';
import 'package:quitanda/src/pages/auth/repository/auth_repository.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();

  Future<void> signIn({required String email, required String password}) async {
    //
    //Simulando o delay para entrar na teka principal.

    isLoading.value = true;

    await authRepository.signIn(email: email, password: password);

    isLoading.value = false;
  }
}
