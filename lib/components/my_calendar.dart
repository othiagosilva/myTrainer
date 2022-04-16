import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_trainer/components/show_dialog.dart';
import 'package:my_trainer/components/show_message.dart';
import 'package:my_trainer/components/text_field.dart';
import 'package:table_calendar/table_calendar.dart';

import 'my_buttons.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({Key? key}) : super(key: key);

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

DateTime? _selectedDay;

class _MyCalendarState extends State<MyCalendar> {
  late CollectionReference aula;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _firstDay = DateTime.utc(2022, 01, 01);
  DateTime _lastDay = DateTime.utc(2030, 12, 31);
  var _txtAthleteID = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    aula = FirebaseFirestore.instance.collection('aula');
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'pt-BR',
      firstDay: _firstDay,
      lastDay: _lastDay,
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      headerStyle: headerStyle(),
      daysOfWeekStyle: daysOfWeekStyle(),
      calendarStyle: calendarStyle(),
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
          myShowDialog(addClassPopUpContent(), context);
        }
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }

  headerStyle() {
    return HeaderStyle(
      formatButtonVisible: false,
      titleCentered: true,
      titleTextStyle: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
      leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
      rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }

  daysOfWeekStyle() {
    return DaysOfWeekStyle(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
      ),
      weekdayStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      weekendStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    );
  }

  calendarStyle() {
    return CalendarStyle(
      todayDecoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        shape: BoxShape.circle,
      ),
      selectedDecoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
      weekendTextStyle: TextStyle(
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      defaultTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      rowDecoration: BoxDecoration(color: Colors.white),
    );
  }

  addClassPopUpContent() {
    return Container(
      height: 150,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
              child: Column(
                children: [
                  WidgetTextField('Código do Aluno', _txtAthleteID),
                ],
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              confirmClassButton(),
              cancelButton(context),
            ]),
          ],
        ),
      ),
    );
  }

  formatDate(date) {
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  confirmClassButton() {
    return ElevatedButton(
      child: buttonLabel('Confirmar'),
      style: confirmButtonStyle(context),
      onPressed: () {
        if (_txtAthleteID.text.isNotEmpty) {
          FirebaseFirestore.instance.collection('aula').add({
            'data': formatDate(_selectedDay).toString(),
            'codAluno': _txtAthleteID.text,
          });
          showMessage('Agendadado com sucesso', context);
          Navigator.pop(context);
          FocusScope.of(context).unfocus();
          _txtAthleteID.text = '';
        }
      },
    );
  }
}
