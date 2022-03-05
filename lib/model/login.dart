import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/components/show_message.dart';

login(email, password, isLoading, context) {
  return FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password)
      .then((value) {
    FirebaseAuth.instance.authStateChanges();
    Navigator.pushReplacementNamed(context, 'home');
  }).catchError((erro) {
    isLoading = false;
    if (erro.code == 'wrong-password' || erro.xcode == 'invalid-email') {
      showMessage('Email ou senha inválido.', context);
    } else if (erro.code == 'user-not-found') {
      showMessage('Usuário não existe', context);
    } else {
      showMessage('ERRO: ${erro.message}.', context);
    }
  });
}
