import 'package:flutter/material.dart';

class RelatorioFeedback extends StatefulWidget {
  const RelatorioFeedback({Key? key}) : super(key: key);

  @override
  _RelatorioFeedbackState createState() => _RelatorioFeedbackState();
}

class _RelatorioFeedbackState extends State<RelatorioFeedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FEEDBACK',
          style: Theme.of(context).textTheme.headline1,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        actions: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'login');
              },
              icon: Icon(
                Icons.logout,
                size: 32,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
