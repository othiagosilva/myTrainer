import 'package:flutter/material.dart';
import 'package:my_trainer/view/usuario.dart';
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
                campoSenha('Senha', txtSenha),
                campoSenha('Redigite a senha', txtRedSenha),
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
                        var obj = new Usuario();
                        obj.usuario = txtUsuario.text;
                        obj.senha = txtSenha.text;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Usuário Cadastrado com sucesso',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        if (permissao == 't') {
                          Navigator.pushNamed(context, 'home', arguments: obj);
                        }
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

  campoSenha(rotulo, variavel) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Text(
            rotulo,
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
          TextFormField(
            style: Theme.of(context).textTheme.headline5,
            controller: variavel,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Insira a Senha';
              }
              return null;
            },
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
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
    );
  }
}
