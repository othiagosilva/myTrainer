import 'package:flutter/material.dart';
import 'package:my_trainer/widgets/widget_iconButton.dart';
import 'package:my_trainer/widgets/widget_textField.dart';

class ConsultarAluno extends StatefulWidget {
  const ConsultarAluno({Key? key}) : super(key: key);

  @override
  _ConsultarAlunoState createState() => _ConsultarAlunoState();
}

class _ConsultarAlunoState extends State<ConsultarAluno> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CONSULTAR ALUNO',
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
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Container(
            width: 170,
            child: Column(
              children: [
                Text(
                  'Nome',
                  style: Theme.of(context).textTheme.headline3,
                )
              ],
            ),
          ),
          Container(
            width: 50,
            child: Column(
              children: [
                Text(
                  'Cód',
                  style: Theme.of(context).textTheme.headline3,
                )
              ],
            ),
          ),
          Container(
            width: 110,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WidgetIconButton(
                      Icons.edit,
                      proxPag: 'alterar_excluir',
                    ),
                    WidgetIconButton(
                      Icons.search,
                      proxPag: 'consultar_dados',
                    ),
                    WidgetIconButton(
                      Icons.delete,
                      // proxPag: '',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
