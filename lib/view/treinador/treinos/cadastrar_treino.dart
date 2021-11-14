import 'package:flutter/material.dart';
import 'package:my_trainer/widgets/widget_logout.dart';

class CadastrarTreino extends StatefulWidget {
  const CadastrarTreino({Key? key}) : super(key: key);

  @override
  _CadastrarTreinoState createState() => _CadastrarTreinoState();
}

class _CadastrarTreinoState extends State<CadastrarTreino> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CADASTRAR TREINO',
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
