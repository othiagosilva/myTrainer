import 'package:flutter/material.dart';
import 'package:my_trainer/widgets/widget_logo.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //*
    //* View
    //*
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          'SOBRE',
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(12),
            child: WidgetLogo(),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 24),
            padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Text(
              'O myTrainer é um aplicativo com foco em auxiliar o profissional de educação física no gerenciamento de seus alunos, treinos, agendamentos e finanças.',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(1000.0),
            child: Image.asset(
              'lib/images/tas.jpg',
              width: 200,
              height: 200,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: Text(
              'Desenvolvido por: Thiago Alves Silva',
              style: Theme.of(context).textTheme.headline3,
            ),
          )
        ],
      ),
    );
  }
}
