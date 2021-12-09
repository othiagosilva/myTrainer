import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/widgets/widget_NavegationButton.dart';
import 'package:my_trainer/widgets/widget_CampoSenha.dart';
import 'package:my_trainer/widgets/widget_CampoTexto.dart';
import 'package:my_trainer/widgets/widget_logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              WidgetLogo(),
              WidgetCampoTexto('Email', txtEmail),
              WidgetCampoSenha(txtSenha),
              //*
              //* BOTÃO ENTRAR
              //! Analisar viabilidade de colocar em um widget
              Container(
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
                    return loginController(txtEmail.text, txtSenha.text);
                  },
                ),
              ),

              WidgetNavegationButton(
                'Cadastre-se',
                Theme.of(context).primaryColor,
                proximaPag: 'register',
              ),

              WidgetNavegationButton(
                'Sobre',
                Theme.of(context).primaryColor,
                proximaPag: 'about',
              ),
            ],
          ),
        ),
      ),
    );
  }

  //*
  //* Login Controller with Firebase Authentication.
  //*
  void loginController(email, senha) {
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

  void exibirMensagem(msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
