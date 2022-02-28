import 'package:flutter/material.dart';
import 'package:my_trainer/components/home_nav_button.dart';
import 'package:my_trainer/components/navegation_button.dart';

class HomeTreinador extends StatelessWidget {
  const HomeTreinador({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            //*
            //* Alunos
            //*
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
            ),
            HomeNavButton('Alunos', 'Consultar', 'consultar_aluno'),
            WidgetNavegationButton(
                'Cadastrar', Theme.of(context).colorScheme.secondary,
                proximaPag: 'cadastrar_dados'),
            //*
            //* Agendamento
            //*
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
            ),
            HomeNavButton('Agendamento', 'Agendar', 'agendar'),
            WidgetNavegationButton(
                'Consultar', Theme.of(context).colorScheme.secondary,
                proximaPag: 'consultar_agendamento'),
            //*
            //* Treinos
            //*
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
            ),
            HomeNavButton('Treinos', 'Consultar', 'consultar_treino'),
            WidgetNavegationButton(
                'Cadastrar', Theme.of(context).colorScheme.secondary,
                proximaPag: 'cadastrar_treino'),
            //*
            //* Relatórios
            //*
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
            ),
            HomeNavButton('Relatórios', 'Feedback', 'feedback'),
            //*
            //* Renda
            //*
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
            ),
            HomeNavButton('Renda', 'Consultar', 'consultar_renda'),
          ],
        ),
      ],
    );
  }
}
