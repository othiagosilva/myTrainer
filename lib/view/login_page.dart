import 'package:flutter/material.dart';
import 'package:my_trainer/widgets/widget_myButton.dart';
import 'package:my_trainer/widgets/widget_textField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var txtEmail = TextEditingController();
  var txtPassword = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(8),
              child: Column(
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
            ),
            Text(
              'LOGIN',
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            WidgetTextField('Email', txtEmail),
            WidgetTextField('Senha', txtPassword),
            WidgetMyButton('Entrar', proximaPag: 'home'),
            WidgetMyButton('Cadastre-se', proximaPag: 'register'),
            Container(
              child: WidgetMyButton('Sobre', proximaPag: 'about'),
            ),
          ],
        ),
      ),
    );
  }
}
