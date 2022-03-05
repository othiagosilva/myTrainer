import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/components/show_message.dart';

sendResetPasswordEmail(context, _txtEmailResetPassword) {
  return FirebaseAuth.instance
      .sendPasswordResetEmail(email: _txtEmailResetPassword.text)
      .then((value) {
    showMessage('Email enviado!', context);
    Navigator.pop(context);
  }).catchError((e) {
    showMessage(
        'Ops! Ocorreu um erro, se for recorrente entre em contato.', context);
    print('ERRO: ${e.message}.');
    Navigator.pop(context);
  });
}
