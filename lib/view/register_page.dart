import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/widgets/widget_textField.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  var txtEmail = TextEditingController();
  var txtUsuario = TextEditingController();
  var txtSenha = TextEditingController();
  String permissao = 't';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          'CADASTRO',
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WidgetTextField('Email', txtEmail),
                WidgetTextField('Usuário', txtUsuario),
                WidgetTextField('Senha', txtSenha),
                Row(
                  children: [
                    Radio(
                      value: "t",
                      groupValue: permissao,
                      onChanged: (value) {
                        setState(() {
                          permissao = value.toString();
                        });
                      },
                      fillColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      'Treinador',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: "a",
                      groupValue: permissao,
                      onChanged: (value) {
                        setState(() {
                          permissao = value.toString();
                        });
                      },
                      fillColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      'Aluno',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: ElevatedButton(
                    child: Text(
                      'Cadastrar',
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
                      if (formKey.currentState!.validate()) {
                        criarConta(
                          txtUsuario.text,
                          txtEmail.text,
                          txtSenha.text,
                        );
                        FirebaseFirestore.instance.collection('usuarios').add({
                          'usuario': txtUsuario.text,
                          'email': txtEmail.text,
                          'senha': txtSenha.text,
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void criarConta(usuario, email, senha) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((value) {
      exibirMensagem('Usuário criado com sucesso!');
      if (permissao == 't') {
        Navigator.pushNamed(context, 'home', arguments: usuario);
      }
    }).catchError((erro) {
      if (erro.code == 'email-already-in-use') {
        exibirMensagem('Email informado está em uso.');
      } else if (erro.code == 'invalid-email') {
        exibirMensagem('Email inválido');
      } else {
        exibirMensagem('${erro.message}');
      }
    });
  }

  void exibirMensagem(msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg,
          style: Theme.of(context).textTheme.headline3,
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
