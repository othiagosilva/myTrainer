import 'package:flutter/material.dart';
import 'package:my_trainer/components/home_nav_button.dart';
import 'package:my_trainer/components/navegation_button.dart';

class HomeAluno extends StatelessWidget {
  const HomeAluno({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
            ),
            HomeNavButton('Alunos', 'Consultar', 'consultar_dados'),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
            ),
            HomeNavButton('Agendamento', 'Agendar', 'agendar'),
            WidgetNavegationButton(
                'Consultar', Theme.of(context).colorScheme.secondary,
                proximaPag: 'consultar_agendamento'),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
            ),
            HomeNavButton('Treinos', 'Consultar', 'consultar_treino'),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
            ),
            HomeNavButton('Relatórios', 'Feedback', 'feedback'),
          ],
        ),
      ],
    );
  }
}
