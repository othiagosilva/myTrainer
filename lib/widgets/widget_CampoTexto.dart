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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Text(
            this.widget.rotulo,
            style: Theme.of(context).textTheme.headline3,
          ),
          TextFormField(
            style: Theme.of(context).textTheme.headline5,
            controller: this.widget.variavel,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Obrigatório';
              }
              return null;
            },
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
                  width: 1.5,
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
