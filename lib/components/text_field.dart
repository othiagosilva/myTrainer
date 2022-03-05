import 'package:flutter/material.dart';

class WidgetTextField extends StatefulWidget {
  final String _label;
  final _controller;

  const WidgetTextField(this._label, this._controller);

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
          Container(
            height: 50,
            child: TextFormField(
              style: Theme.of(context).textTheme.headline5,
              controller: this.widget._controller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Obrigatório';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: this.widget._label,
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
      ),
    );
  }
}
