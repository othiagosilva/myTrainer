import 'package:flutter/material.dart';

class WidgetCampoSenha extends StatefulWidget {
  final txtSenha;

  const WidgetCampoSenha(this.txtSenha);

  @override
  _WidgetCampoSenhaState createState() => _WidgetCampoSenhaState();
}

class _WidgetCampoSenhaState extends State<WidgetCampoSenha> {
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
