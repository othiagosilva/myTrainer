import 'package:flutter/material.dart';
import 'package:my_trainer/components/logout.dart';
import 'package:my_trainer/components/my_buttons.dart';
import 'package:my_trainer/components/show_message.dart';
import 'package:my_trainer/components/show_dialog.dart';
import 'package:my_trainer/components/text_field.dart';

class AvailableHours extends StatefulWidget {
  const AvailableHours({Key? key}) : super(key: key);

  @override
  State<AvailableHours> createState() => _AvailableHoursState();
}

class _AvailableHoursState extends State<AvailableHours> {
  List _availableHour = [];
  var _txtHour = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HORÁRIOS DISPONÍVEIS',
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
      body: Column(
        children: [
          ListView.builder(
            itemCount: _availableHour.length - 1,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Container(
                        child: Text(_availableHour.toString(),
                            style: Theme.of(context).textTheme.headline3),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          addHourButton(),
        ],
      ),
    );
  }

  addHourButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        await myShowDialog(addHourPopUpContent(), context);
      },
    );
  }

  addHourPopUpContent() {
    return Container(
      height: 220,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
              child: Column(
                children: [
                  WidgetTextField('Hora', _txtHour),
                ],
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              confirmHourButton(),
              cancelButton(context),
            ]),
          ],
        ),
      ),
    );
  }

  confirmHourButton() {
    return ElevatedButton(
      child: buttonLabel('Confirmar'),
      style: confirmButtonStyle(context),
      onPressed: () {
        if (_txtHour.text.isNotEmpty) {
          _availableHour.add(_txtHour);
          showMessage('Adicionada com sucesso', context);
          Navigator.pop(context);
          FocusScope.of(context).unfocus();
          _txtHour.text = '';
        }
      },
    );
  }
}
