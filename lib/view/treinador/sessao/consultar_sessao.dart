import 'package:flutter/material.dart';
import 'package:my_trainer/widgets/widget_logout.dart';

class ConsultarSessao extends StatefulWidget {
  const ConsultarSessao({Key? key}) : super(key: key);

  @override
  _ConsultarSessaoState createState() => _ConsultarSessaoState();
}

class _ConsultarSessaoState extends State<ConsultarSessao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CONSULTAR HORÁRIO',
          style: Theme.of(context).textTheme.headline1,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        actions: [
          WidgetLogout(),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
