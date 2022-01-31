class Usuario {
  String _nomeDeUsuario = '';
  String _email = '';
  String _senha = '';
  String _permissao = '';
  int? _cref;

  Usuario(String nomeDeUsuario, String email, String senha, String permissao,
      {int? cref}) {
    this.nomeDeUsuario(nomeDeUsuario);
    this.email(email);
    this.senha(senha);
    this.permissao(permissao);

    if (cref != null) {
      this.cref(cref);
    }
  }

  get nomeDeUsuario => this._nomeDeUsuario;
  set nomeDeUsuario(value) => this._nomeDeUsuario = value;

  get email => this._email;
  set email(value) => this._email = value;

  get senha => this._senha;
  set senha(value) => this._senha = value;

  get permissao => this._permissao;
  set permissao(value) => this._permissao = value;

  get cref => this._cref;
  set cref(value) => this._cref = value;
}
