import 'package:flutter/material.dart';
import 'package:my_trainer/widgets/widget_myButton.dart';
import 'package:my_trainer/widgets/widget_textField.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var txtEmail = TextEditingController();
  var txtUsuario = TextEditingController();
  var txtSenha = TextEditingController();
  var txtRedSenha = TextEditingController();
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
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WidgetTextField('Email', txtEmail),
            WidgetTextField('Usuário', txtUsuario),
            WidgetTextField('Senha', txtSenha),
            WidgetTextField('Redigite a senha', txtRedSenha),
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
            WidgetMyButton('Cadastrar'),
          ],
        ),
      ),
    );
  }
}
