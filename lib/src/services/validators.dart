import 'package:get/get.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'Digite seu email!';
  }

  if (!email.isEmail) return 'Digite um e-mail valido!';

  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return 'Digite sua senha!';
  }

  if (password.length < 7) {
    return 'Digite uma senha com pelo menos 7 caracteres';
  }

  return null;
}

String? nameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return 'Digite sua senha!';
  }

  final names = name.split(' ');

  if (names.length == 1) return 'Digite seu nome completo';

  return null;
}

String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) {
    return 'Digite sua senha!';
  }

  if (!phone.isPhoneNumber) return 'Digite um numero de telefone válido';

  return null;
}

String? cpfValidator(String? cpf) {
  if (cpf == null || cpf.isEmpty) {
    return 'Digite sua senha!';
  }

  if (!cpf.isCpf) return 'Digite um numero de CPF válido';

  return null;
}
