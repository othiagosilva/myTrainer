import 'package:flutter/material.dart';
import 'package:my_trainer/components/campo_senha.dart';
import 'package:my_trainer/components/campo_texto.dart';
import 'package:my_trainer/model/account/create_account.dart';
import 'package:my_trainer/model/account/register_account.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var _txtEmail = TextEditingController();
  var _txtUser = TextEditingController();
  var _txtPassword = TextEditingController();
  String _permission = 't';

  @override
  Widget build(BuildContext context) {
    return registerPageBody();
  }

  registerPageBody() {
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
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WidgetCampoTexto('Email', _txtEmail),
                WidgetCampoTexto('Usuário', _txtUser),
                WidgetCampoSenha(_txtPassword),
                permission(),
                registerButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  permission() {
    return Row(
      children: [
        Radio(
          value: "t",
          groupValue: _permission,
          onChanged: (value) {
            setState(() {
              _permission = value.toString();
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
        Radio(
          value: "a",
          groupValue: _permission,
          onChanged: (value) {
            setState(() {
              _permission = value.toString();
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
    );
  }

  registerButton() {
    return Container(
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
          // if (formKey.currentState!.validate()) {
          createAccount(_txtUser, _txtEmail.text, _txtPassword.text,
              _permission, context);
          registerAccount(
              _txtUser, _txtEmail.text, _txtPassword.text, _permission);
          // }s
        },
      ),
    );
  }
}
