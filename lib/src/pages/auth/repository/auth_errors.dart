String authErrorsString(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'Email e/ou Senha inválidos';
    case 'Invalid session token':
      return 'Sua sessão foi finalizada, entre novamente!';
    case 'INVALID_DATA':
      return 'Dados inválidos ou Usuário já existente, verifique-os novamente!';

    default:
      return "Erro INDEFINIDO";
  }
}
