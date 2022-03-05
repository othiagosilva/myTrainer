import 'package:flutter/material.dart';
import 'package:my_trainer/components/navegation_button.dart';
import 'package:my_trainer/components/password_field.dart';
import 'package:my_trainer/components/text_field.dart';
import 'package:my_trainer/components/logo.dart';
import 'package:my_trainer/model/login.dart';

import '../components/reset_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _txtEmail = TextEditingController();
  var _txtPassword = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return loginBody();
  }

  loginBody() {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        child: SingleChildScrollView(
          child: Form(
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
                        WidgetTextField('Email', _txtEmail),
                        WidgetPasswordField(_txtPassword),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: forgetPassword(context),
                        )
                      ],
                    ),
                  ),
                  loginButton(),
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

  loginButton() {
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
          return login(_txtEmail.text, _txtPassword.text, isLoading, context);
        },
      ),
    );
  }
}
