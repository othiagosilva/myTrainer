import 'package:flutter/material.dart';
import 'package:my_trainer/widgets/widget_Logout.dart';

class ConsultarAgendamento extends StatefulWidget {
  const ConsultarAgendamento({Key? key}) : super(key: key);

  @override
  _ConsultarAgendamentoState createState() => _ConsultarAgendamentoState();
}

class _ConsultarAgendamentoState extends State<ConsultarAgendamento> {
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
