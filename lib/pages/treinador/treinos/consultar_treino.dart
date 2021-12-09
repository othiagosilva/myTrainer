import 'package:flutter/material.dart';
import 'package:my_trainer/widgets/widget_Logout.dart';

class ConsultarTreino extends StatefulWidget {
  const ConsultarTreino({Key? key}) : super(key: key);

  @override
  _ConsultarTreinoState createState() => _ConsultarTreinoState();
}

class _ConsultarTreinoState extends State<ConsultarTreino> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CONSULTAR TREINO',
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
