import 'package:flutter/material.dart';
import 'package:my_trainer/components/my_buttons.dart';
import 'package:my_trainer/components/navegation_button.dart';

class WidgetExclude extends StatefulWidget {
  final _text;
  const WidgetExclude(this._text, {Key? key}) : super(key: key);

  @override
  _WidgetExcludeState createState() => _WidgetExcludeState();
}

class _WidgetExcludeState extends State<WidgetExclude> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      backgroundColor: Color.fromRGBO(238, 238, 238, 1),
      content: SingleChildScrollView(
        child: Text(
          this.widget._text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
      actions: [
        WidgetNavegationButton(
          'Confirmar',
          Theme.of(context).primaryColor,
        ),
        cancelButton(context),
      ],
    );
  }
}
