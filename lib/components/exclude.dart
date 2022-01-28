import 'package:flutter/material.dart';
import 'package:my_trainer/components/navegation_button.dart';

class WidgetExclude extends StatefulWidget {
  final texto;
  const WidgetExclude(this.texto, {Key? key}) : super(key: key);

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
          this.widget.texto,
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
        myButton(
          'Cancelar',
          Theme.of(context).colorScheme.secondary,
        ),
      ],
    );
  }

  myButton(rotulo, cor) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        child: Text(
          rotulo,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            cor,
          ),
          elevation: MaterialStateProperty.all<double>(0),
          fixedSize: MaterialStateProperty.all<Size>(
            Size(200, 50),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
