import 'package:my_trainer/model/usuario/usuario.dart';

class Aluno extends Usuario {
  String _permissao = 'a';

  Aluno(String nomeDeUsuario, String email, String senha)
      : super(nomeDeUsuario, email, senha);

  get permissao => this._permissao;
}
