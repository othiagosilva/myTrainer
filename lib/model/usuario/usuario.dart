abstract class Usuario {
  String _nomeDeUsuario = '';
  String _email = '';
  String _senha = '';

  Usuario(String nomeDeUsuario, String email, String senha);

  get nomeDeUsuario => this._nomeDeUsuario;
  set nomeDeUsuario(nomeDeUsuario) => this._nomeDeUsuario = nomeDeUsuario;

  get email => this._email;
  set email(email) => this._email = email;

  get senha => this._senha;
  set senha(senha) => this._senha = senha;
}
