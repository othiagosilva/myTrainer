import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/components/NavegationButton.dart';
import 'package:my_trainer/components/CampoSenha.dart';
import 'package:my_trainer/components/CampoTexto.dart';
import 'package:my_trainer/components/Logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  bool isLoading = false;
  // final formKey = GlobalKey<FormState>();
  //*
  //* View
  //*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            // key: formKey,
            child: Container(
              padding: EdgeInsets.fromLTRB(24, 96, 24, 24),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 32),
                    child: WidgetLogo(),
                  ),
                  Text(
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 32),
                    child: Column(
                      children: [
                        WidgetCampoTexto('Email', txtEmail),
                        WidgetCampoSenha(txtSenha),
                      ],
                    ),
                  ),
                  botaoEntrar(),
                  WidgetNavegationButton(
                    'Cadastre-se',
                    Theme.of(context).primaryColor,
                    proximaPag: 'cadastro',
                  ),
                  WidgetNavegationButton(
                    'Sobre',
                    Theme.of(context).primaryColor,
                    proximaPag: 'sobre',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //*
  //* Model
  //*
  void login(email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((value) {
      Navigator.pushReplacementNamed(context, 'home', arguments: email);
    }).catchError((erro) {
      if (erro.code == 'wrong-password' || erro.code == 'invalid-email') {
        exibirMensagem('Email ou senha inválido.');
      } else if (erro.code == 'user-not-found') {
        exibirMensagem('Usuário não existe');
      } else {
        exibirMensagem('ERRO: ${erro.message}.');
      }
    });
  }

  //*
  //* Functions
  //*
  void exibirMensagem(msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: Duration(seconds: 2),
      ),
    );
  }

  botaoEntrar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        child: Text(
          'Entrar',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).primaryColor,
          ),
          elevation: MaterialStateProperty.all<double>(0),
          fixedSize: MaterialStateProperty.all<Size>(
            Size(200, 50),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        onPressed: () {
          setState(() {
            isLoading = true;
          });
          return login(txtEmail.text, txtSenha.text);
        },
      ),
    );
  }
}
