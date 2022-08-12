String authErrorsString(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'Email e/ou Senha inválidos';
    case 'Invalid session token':
      return 'Sua sessão foi finalizada, entre novamente!';
    default:
      return "Erro INDEFINIDO";
  }
}
