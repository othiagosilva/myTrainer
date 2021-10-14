import 'package:flutter/material.dart';

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
