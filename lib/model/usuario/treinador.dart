import 'package:my_trainer/model/usuario/usuario.dart';

class Treinador extends Usuario {
  String _cref = '';
  String _permissao = 't';

  Treinador(nomeDeUsuario, email, senha, cref)
      : super(nomeDeUsuario, email, senha) {
    this.cref(cref);
  }

  get cref => this._cref;
  set cref(cref) => this._cref = cref;

  get permissao => this._permissao;
}
