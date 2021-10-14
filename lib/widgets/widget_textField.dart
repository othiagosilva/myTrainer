import 'package:flutter/material.dart';

class WidgetTextField extends StatefulWidget {
  final String rotulo;
  final variavel;

  const WidgetTextField(this.rotulo, this.variavel);

  @override
  _WidgetTextFieldState createState() => _WidgetTextFieldState();
}

class _WidgetTextFieldState extends State<WidgetTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Text(
            this.widget.rotulo,
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
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
