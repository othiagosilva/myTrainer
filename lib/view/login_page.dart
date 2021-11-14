import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/widgets/widget_NavButton.dart';
import 'package:my_trainer/widgets/widget_textField.dart';

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
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(71, 9, 9, 1),
                          blurRadius: 0,
                        ),
                      ],
                      border: Border.all(width: 2.0, color: Colors.white),
                    ),
                    child: Icon(
                      Icons.fitness_center,
                      color: Theme.of(context).primaryColor,
                      size: 90,
                    ),
                  ),
                  Text(
                    'myTrainer',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              WidgetTextField('Email', txtEmail),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    Text(
                      'Senha',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    TextFormField(
                      style: Theme.of(context).textTheme.headline5,
                      controller: txtSenha,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Insira a Senha';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ],
                ),
              ),
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
                    login(txtEmail.text, txtSenha.text);
                  },
                ),
              ),
              WidgetNavButton(
                'Cadastre-se',
                Theme.of(context).primaryColor,
                proximaPag: 'register',
              ),
              Container(
                child: WidgetNavButton(
                  'Sobre',
                  Theme.of(context).primaryColor,
                  proximaPag: 'about',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login(email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((value) {
      Navigator.pushReplacementNamed(context, 'home', arguments: 'thiago');
    }).catchError((erro) {
      if (erro.code == 'user-not-found' ||
          erro.code == 'wrong-password' ||
          erro.code == 'invalid-email') {
        exibirMensagem('ERRO: Email ou senha inválido.');
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
