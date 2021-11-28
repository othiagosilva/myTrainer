import 'package:flutter/material.dart';
import 'package:my_trainer/widgets/widget_Logout.dart';

class AgendarSessao extends StatefulWidget {
  const AgendarSessao({Key? key}) : super(key: key);

  @override
  _AgendarSessaoState createState() => _AgendarSessaoState();
}

class _AgendarSessaoState extends State<AgendarSessao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AGENDAR HORÁRIO',
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
