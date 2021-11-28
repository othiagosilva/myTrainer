import 'package:flutter/material.dart';

class WidgetPasswordField extends StatefulWidget {
  final txtSenha;

  const WidgetPasswordField(this.txtSenha);

  @override
  _WidgetPasswordFieldState createState() => _WidgetPasswordFieldState();
}

class _WidgetPasswordFieldState extends State<WidgetPasswordField> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            controller: this.widget.txtSenha,
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
