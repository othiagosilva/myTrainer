import 'package:flutter/material.dart';
import 'package:my_trainer/components/campo_texto.dart';
import 'package:my_trainer/model/account/reset_password.dart';

forgetPassword(context) {
  var _txtEmailResetPassword = TextEditingController();
  return InkWell(
    child: Text(
      'Esqueci minha senha',
      style: TextStyle(
        fontSize: 16,
        color: Color.fromRGBO(198, 26, 26, 1),
        decoration: TextDecoration.underline,
      ),
    ),
    onTap: () => resetPassword(context, _txtEmailResetPassword),
  );
}

resetPassword(context, _txtEmailResetPassword) {
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
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                    child: Column(
                      children: [
                        WidgetCampoTexto('Email', _txtEmailResetPassword),
                      ],
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        sendButton(context, _txtEmailResetPassword),
                        cancelButton(context),
                      ]),
                ],
              ),
            ),
          ),
        );
      });
}

sendButton(context, _txtEmailResetPassword) {
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
        sendResetPasswordEmail(context, _txtEmailResetPassword);
      },
    ),
  );
}

cancelButton(context) {
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
