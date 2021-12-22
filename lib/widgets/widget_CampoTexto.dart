import 'package:flutter/material.dart';

class WidgetCampoTexto extends StatefulWidget {
  final String rotulo;
  final variavel;

  const WidgetCampoTexto(this.rotulo, this.variavel);

  @override
  _WidgetCampoTextoState createState() => _WidgetCampoTextoState();
}

class _WidgetCampoTextoState extends State<WidgetCampoTexto> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          child: TextFormField(
            style: Theme.of(context).textTheme.headline5,
            controller: this.widget.variavel,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Obrigatório';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: this.widget.rotulo,
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
                  width: 1.5,
                ),
              ),
              fillColor: Colors.white,
              filled: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.5, horizontal: 10.0),
            ),
          ),
        ),
      ],
    );
  }
}
