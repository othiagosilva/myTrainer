import 'package:flutter/material.dart';

class WidgetCampoSenha extends StatefulWidget {
  final txtSenha;

  const WidgetCampoSenha(this.txtSenha);

  @override
  _WidgetCampoSenhaState createState() => _WidgetCampoSenhaState();
}

class _WidgetCampoSenhaState extends State<WidgetCampoSenha> {
  bool _verSenha = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Container(
            height: 50,
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: this.widget.txtSenha,
              obscureText: !_verSenha,
              style: Theme.of(context).textTheme.headline5,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Insira a Senha';
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0.5, horizontal: 10.0),
                labelText: "Senha",
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
                suffixIcon: IconButton(
                    icon: Icon(
                      _verSenha ? Icons.visibility : Icons.visibility_off,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _verSenha = !_verSenha;
                      });
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
