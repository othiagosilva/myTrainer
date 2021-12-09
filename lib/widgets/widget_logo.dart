import 'package:flutter/material.dart';

class WidgetLogo extends StatelessWidget {
  const WidgetLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(71, 9, 9, 1),
                blurRadius: 0,
              ),
            ],
            border: Border.all(width: 2.0, color: Colors.white),
          ),
          child: Icon(
            Icons.fitness_center,
            color: Theme.of(context).primaryColor,
            size: 90,
          ),
        ),
        Text(
          'myTrainer',
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 32,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
