import 'package:cloud_firestore/cloud_firestore.dart';

registerAccount(usuario, email, senha, permissao) {
  return FirebaseFirestore.instance.collection('usuarios').add({
    'usuario': usuario.text,
    'email': email,
    'senha': senha,
    'permissao': permissao,
  });
}
