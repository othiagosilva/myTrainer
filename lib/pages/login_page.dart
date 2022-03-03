import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/components/navegation_button.dart';
import 'package:my_trainer/components/campo_senha.dart';
import 'package:my_trainer/components/campo_texto.dart';
import 'package:my_trainer/components/logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  bool isLoading = false;

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
                        Align(
                          alignment: Alignment.bottomRight,
                          child: esqueciSenha(),
                        )
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

  void login(email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((value) {
      FirebaseAuth.instance.authStateChanges();
      Navigator.pushReplacementNamed(context, 'home');
    }).catchError((erro) {
      isLoading = false;
      if (erro.code == 'wrong-password' || erro.xcode == 'invalid-email') {
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

  esqueciSenha() {
    return InkWell(
      child: Text(
        'Esqueci minha senha',
        style: TextStyle(
          fontSize: 16,
          color: Color.fromRGBO(198, 26, 26, 1),
          decoration: TextDecoration.underline,
        ),
      ),
      onTap: () => redefinirSenha(),
    );
  }

  redefinirSenha() {
    var txtEmail = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            backgroundColor: Theme.of(context).backgroundColor,
            title: Text(
              'Redefinir senha',
              style: (TextStyle(
                fontSize: 30,
              )),
            ),
            content: Container(
              height: 150,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: Column(
                        children: [
                          WidgetCampoTexto('Email', txtEmail),
                        ],
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          botaoEnviar(txtEmail.text),
                          botaoCancelar(),
                        ]),
                  ],
                ),
              ),
            ),
          );
        });
  }

  botaoEnviar(email) {
    return Container(
      padding: EdgeInsets.all(8),
      child: ElevatedButton(
        child: Text(
          'Enviar',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).primaryColor,
          ),
          elevation: MaterialStateProperty.all<double>(0),
          fixedSize: MaterialStateProperty.all<Size>(
            Size(120, 30),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        onPressed: () {
          FirebaseAuth.instance
              .sendPasswordResetEmail(email: email)
              .catchError((erro) {
            print('ERRO: ${erro.message}.');
          });
          Navigator.pop(context);
        },
      ),
    );
  }

  botaoCancelar() {
    return Container(
      padding: EdgeInsets.all(8),
      child: ElevatedButton(
        child: Text(
          'Cancelar',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).colorScheme.secondary,
          ),
          elevation: MaterialStateProperty.all<double>(0),
          fixedSize: MaterialStateProperty.all<Size>(
            Size(120, 30),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
