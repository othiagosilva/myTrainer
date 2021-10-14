import 'package:flutter/material.dart';
import 'package:my_trainer/widgets/widget_NavButton.dart';

class WidgetExclusao extends StatefulWidget {
  final texto;
  const WidgetExclusao(this.texto, {Key? key}) : super(key: key);

  @override
  _WidgetExclusaoState createState() => _WidgetExclusaoState();
}

class _WidgetExclusaoState extends State<WidgetExclusao> {
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
        WidgetNavButton(
          'Confirmar',
          Theme.of(context).primaryColor,
        ),
        MyButton(
          'Cancelar',
          Theme.of(context).accentColor,
        ),
      ],
    );
  }
}

class MyButton extends StatelessWidget {
  final rotulo;
  final cor;
  const MyButton(this.rotulo, this.cor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
