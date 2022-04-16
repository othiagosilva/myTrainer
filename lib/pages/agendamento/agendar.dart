import 'package:flutter/material.dart';
import 'package:my_trainer/components/logout.dart';
import 'package:my_trainer/components/my_calendar.dart';
import 'package:my_trainer/components/navegation_button.dart';

class Agendar extends StatefulWidget {
  const Agendar({Key? key}) : super(key: key);

  @override
  _AgendarState createState() => _AgendarState();
}

class _AgendarState extends State<Agendar> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 24),
              padding: EdgeInsets.all(8),
              child: MyCalendar(),
            ),
            WidgetNavegationButton(
                'Editar Horários', Theme.of(context).primaryColor,
                proximaPag: 'horarios_disponiveis'),
          ],
        ),
      ),
    );
  }
}
