import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_trainer/pages/agendamento/available_hours.dart';
import 'package:my_trainer/pages/login_page.dart';
import 'package:my_trainer/pages/register_page.dart';
import 'package:my_trainer/pages/about_page.dart';
import 'package:my_trainer/pages/home/home_page.dart';
import 'package:my_trainer/pages/aluno/cadastrar_dados_aluno.dart';
import 'package:my_trainer/pages/aluno/consultar_aluno.dart';
import 'package:my_trainer/pages/aluno/alterar_dados.dart';
import 'package:my_trainer/pages/aluno/consultar_dados.dart';
import 'package:my_trainer/pages/agendamento/agendar.dart';
import 'package:my_trainer/pages/agendamento/consultar_agendamento.dart';
import 'package:my_trainer/pages/treinos/cadastrar_treino.dart';
import 'package:my_trainer/pages/treinos/consultar_treino.dart';
import 'package:my_trainer/pages/feedback/feedback.dart';
import 'package:my_trainer/pages/renda/consultar_renda.dart';

import 'components/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Intl.defaultLocale = 'pt_BR';

  initializeDateFormatting().then((_) => runApp(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'myTrainer',
          theme: myTrainerTheme,
          initialRoute: 'login',
          routes: {
            'login': (context) => LoginPage(),
            'cadastro': (context) => RegisterPage(),
            'sobre': (context) => SobrePage(),
            'home': (context) => HomePage(),
            'cadastrar_dados': (context) => CadastrarDados(),
            'consultar_aluno': (context) => ConsultarAluno(),
            'consultar_dados': (context) => ConsultarDados(),
            //'alterar_dados': (context) => AlterarExcluir(),
            'agendar': (context) => Agendar(),
            'consultar_agendamento': (context) => ConsultarAgendamento(),
            'horarios_disponiveis': (context) => AvailableHours(),
            'cadastrar_treino': (context) => CadastrarTreino(),
            'consultar_treino': (context) => ConsultarTreino(),
            'feedback': (context) => FeedbackAluno(),
            'consultar_renda': (context) => ConsultarRenda(),
          },
        ),
      ));
}
