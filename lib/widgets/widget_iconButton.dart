import 'package:flutter/material.dart';

class WidgetIconButton extends StatelessWidget {
  final proxPag;
  final icon;

  const WidgetIconButton(this.icon, {this.proxPag});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, proxPag);
        },
        icon: Icon(
          this.icon,
          size: 32,
        ),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
