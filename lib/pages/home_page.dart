import 'package:flutter/material.dart';
import 'package:my_trainer/components/navegation_button.dart';
import 'package:my_trainer/components/logout.dart';
import 'package:my_trainer/model/usuario/nomeDeUsuario.dart';

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
        leading: NomeDeUsuario(),
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
          WidgetLogout(),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(
        children: [
          Column(
            children: [
              //*
              //* Alunos
              //*
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
              ),
              viewHome1Button('Alunos', 'Consultar', 'consultar_aluno'),
              WidgetNavegationButton(
                  'Cadastrar', Theme.of(context).colorScheme.secondary,
                  proximaPag: 'cadastrar_aluno'),
              //*
              //* Agendamento
              //*
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
              ),
              viewHome1Button('Agendamento', 'Agendar', 'agendar'),
              WidgetNavegationButton(
                  'Consultar', Theme.of(context).colorScheme.secondary,
                  proximaPag: 'consultar_agendamento'),
              //*
              //* Treinos
              //*
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
              ),
              viewHome1Button('Treinos', 'Consultar', 'consultar_treino'),
              WidgetNavegationButton(
                  'Cadastrar', Theme.of(context).colorScheme.secondary,
                  proximaPag: 'cadastrar_treino'),
              //*
              //* Relatórios
              //*
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
              ),
              viewHome1Button('Relatórios', 'Feedback', 'feedback'),
              //*
              //* Renda
              //*
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
              ),
              viewHome1Button('Renda', 'Consultar', 'consultar_renda'),
            ],
          ),
        ],
      ),
    );
  }

  viewHome1Button(titulo, tituloBotao1, paginaBotao1) {
    return Container(
      child: Column(
        children: [
          Text(
            titulo,
            style: Theme.of(context).textTheme.headline4,
          ),
          WidgetNavegationButton(
            tituloBotao1,
            Theme.of(context).colorScheme.secondary,
            proximaPag: paginaBotao1,
          ),
        ],
      ),
    );
  }
}
