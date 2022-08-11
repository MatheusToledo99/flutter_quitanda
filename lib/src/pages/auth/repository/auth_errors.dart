String authErrorsString(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'Email e/ou Senha inválidos';
    default:
      return "Erro INDEFINIDO";
  }
}
