import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/components/show_message.dart';

createAccount(usuario, email, senha, permissao, context) {
  return FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: senha)
      .then((value) {
    showMessage('Usuário criado com sucesso!', context);
    Navigator.pushReplacementNamed(context, 'login');
  }).catchError((erro) {
    if (erro.code == 'email-already-in-use') {
      showMessage('Email informado está em uso.', context);
    } else if (erro.code == 'invalid-email') {
      showMessage('Email inválido', context);
    } else {
      showMessage('${erro.message}', context);
    }
  });
}
