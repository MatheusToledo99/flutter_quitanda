import 'package:quitanda/src/constants/endpoints.dart';
import 'package:quitanda/src/models/user_model.dart';
import 'package:quitanda/src/services/http_manager.dart';

class AuthRepository {
  //
  final HttpManager _httpManager = HttpManager();

  Future<void> signIn({required String email, required String password}) async {
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
      final resultadoLogin = UserModel.fromJson(result['result']);
      print(resultadoLogin.toString());
    } else {
      print('SignIn não Funcionou');
    }
  }
}
