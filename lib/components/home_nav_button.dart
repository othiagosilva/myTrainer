import 'package:flutter/material.dart';
import 'package:my_trainer/components/navegation_button.dart';

class HomeNavButton extends StatefulWidget {
  final titulo;
  final tituloBotao;
  final paginaBotao;

  const HomeNavButton(this.titulo, this.tituloBotao, this.paginaBotao,
      {Key? key})
      : super(key: key);

  @override
  _HomeNavButtonState createState() => _HomeNavButtonState();
}

class _HomeNavButtonState extends State<HomeNavButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            this.widget.titulo,
            style: Theme.of(context).textTheme.headline4,
          ),
          WidgetNavegationButton(
            this.widget.tituloBotao,
            Theme.of(context).colorScheme.secondary,
            proximaPag: this.widget.paginaBotao,
          ),
        ],
      ),
    );
  }
}
