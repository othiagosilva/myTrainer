import 'package:flutter/material.dart';

class WidgetPasswordField extends StatefulWidget {
  final _txtPassword;

  const WidgetPasswordField(this._txtPassword);

  @override
  _WidgetPasswordFieldState createState() => _WidgetPasswordFieldState();
}

class _WidgetPasswordFieldState extends State<WidgetPasswordField> {
  bool _revealPassword = false;

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
              controller: this.widget._txtPassword,
              obscureText: !_revealPassword,
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
                      _revealPassword ? Icons.visibility : Icons.visibility_off,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _revealPassword = !_revealPassword;
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
