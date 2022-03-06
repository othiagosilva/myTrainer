import 'package:flutter/material.dart';
import 'package:my_trainer/components/navegation_button.dart';

class HomeNavButton extends StatefulWidget {
  final _title;
  final _buttonTitle;
  final _buttonPage;

  const HomeNavButton(this._title, this._buttonTitle, this._buttonPage,
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
            this.widget._title,
            style: Theme.of(context).textTheme.headline4,
          ),
          WidgetNavegationButton(
            this.widget._buttonTitle,
            Theme.of(context).colorScheme.secondary,
            proximaPag: this.widget._buttonPage,
          ),
        ],
      ),
    );
  }
}
