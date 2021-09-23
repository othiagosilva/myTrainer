import 'package:flutter/material.dart';
import 'package:my_trainer/widgets/widget_exclusao.dart';

class WidgetBotaoExclusao extends StatelessWidget {
  final texto;

  const WidgetBotaoExclusao(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return WidgetExclusao(
                texto,
              );
            },
          );
        },
        icon: Icon(
          Icons.delete,
          size: 32,
        ),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
