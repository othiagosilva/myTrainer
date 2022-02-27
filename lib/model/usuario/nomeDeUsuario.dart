import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NomeDeUsuario extends StatefulWidget {
  const NomeDeUsuario({Key? key}) : super(key: key);

  @override
  _NomeDeUsuarioState createState() => _NomeDeUsuarioState();
}

class _NomeDeUsuarioState extends State<NomeDeUsuario> {
  late CollectionReference usuarios;

  @override
  void initState() {
    super.initState();
    usuarios = FirebaseFirestore.instance.collection('usuarios');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 14, 0, 0),
      child: nomeDeUsuario(),
    );
  }

  nomeDeUsuario() {
    return StreamBuilder<QuerySnapshot>(
        stream: usuarios.snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(
                child: Text('Não foi possível conectar ao Firestore'),
              );
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              final dados = snapshot.requireData;
              User? user = FirebaseAuth.instance.currentUser;

              for (int index = 0; index < dados.size; index++) {
                updateFirebaseUsername(dados.docs[index], user);
              }

              for (int index = 0; index < dados.size; index++) {
                if (checaUsuario(dados.docs[index], user)) {
                  return getUser(user?.displayName, dados.docs[index]);
                }
              }
              return Text('como chegou aqui?');
          }
        });
  }

  updateFirebaseUsername(dados, user) {
    String email = dados.data()['email'];
    String usuario = dados.data()['usuario'];

    if (email == user?.email) {
      user?.updateDisplayName(usuario);
    }
  }

  bool checaUsuario(dados, user) {
    String usuario = dados.data()['usuario'];

    if (usuario == user?.displayName) {
      return true;
    }

    return false;
  }

  getUser(usuario, dados) {
    String permissao = dados.data()['permissao'];
    String permissaoUsuario = 'treinador';

    if (permissao == 'a') {
      permissaoUsuario = 'aluno';
    }

    return Column(
      children: [
        Text(
          usuario.toString(),
          style: TextStyle(fontSize: 16),
        ),
        Text(
          permissaoUsuario,
          style: TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.italic,
            color: Theme.of(context).primaryColor,
          ),
        )
      ],
    );
  }
}
