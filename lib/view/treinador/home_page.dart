import 'package:flutter/material.dart';
import 'package:my_trainer/widgets/widget_myButton.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
          padding: EdgeInsets.fromLTRB(0, 14, 0, 0),
          child: Column(
            children: [
              Text(
                'thiago.silva',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'treinador',
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
        leadingWidth: 128,
        title: Text(
          'HOME',
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
        children: [
          Container(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 16, 0, 24),
                  child: Column(
                    children: [
                      Text(
                        'Alunos',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      WidgetMyButton(
                        'Cadastrar',
                        Theme.of(context).accentColor,
                        proximaPag: 'cadastrar_dados',
                      ),
                      WidgetMyButton(
                        'Consultar',
                        Theme.of(context).accentColor,
                        proximaPag: 'consultar_aluno',
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Column(
                    children: [
                      Text(
                        'Sessões',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      WidgetMyButton(
                        'Agendar',
                        Theme.of(context).accentColor,
                        proximaPag: 'agendar',
                      ),
                      WidgetMyButton(
                        'Consultar',
                        Theme.of(context).accentColor,
                        proximaPag: 'consultar_sessao',
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Column(
                    children: [
                      Text(
                        'Treinos',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      WidgetMyButton(
                        'Cadastrar',
                        Theme.of(context).accentColor,
                        proximaPag: 'cadastrar_treino',
                      ),
                      WidgetMyButton(
                        'Consultar',
                        Theme.of(context).accentColor,
                        proximaPag: 'consultar_treino',
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Column(
                    children: [
                      Text(
                        'Relatórios',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      WidgetMyButton(
                        'Feedback',
                        Theme.of(context).accentColor,
                        proximaPag: 'feedback',
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        'Renda',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      WidgetMyButton(
                        'Adicionar',
                        Theme.of(context).accentColor,
                        proximaPag: 'adicionar_renda',
                      ),
                      WidgetMyButton(
                        'Consultar',
                        Theme.of(context).accentColor,
                        proximaPag: 'consultar_renda',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
