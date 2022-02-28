import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/pages/login_page.dart';
import 'package:my_trainer/pages/cadastro_page.dart';
import 'package:my_trainer/pages/sobre_page.dart';
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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final ThemeData theme = ThemeData();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'myTrainer',
      theme: theme.copyWith(
        primaryColor: Color.fromRGBO(198, 26, 26, 1),
        backgroundColor: Color.fromRGBO(17, 17, 17, 1),
        colorScheme:
            theme.colorScheme.copyWith(secondary: Color.fromRGBO(71, 9, 9, 1)),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            fontSize: 24,
            color: Color.fromRGBO(198, 26, 26, 1),
            fontWeight: FontWeight.bold,
          ),
          headline3: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
          headline4: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline5: TextStyle(
            fontSize: 22,
            color: Colors.black,
          ),
          headline6: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginPage(),
        'cadastro': (context) => RegisterPage(),
        'sobre': (context) => SobrePage(),
        'home': (context) => HomePage(),
        'cadastrar_dados': (context) => CadastrarDados(),
        'consultar_aluno': (context) => ConsultarAluno(),
        'consultar_dados': (context) => ConsultarDados(),
        'alterar_dados': (context) => AlterarExcluir(),
        'agendar': (context) => Agendar(),
        'consultar_agendamento': (context) => ConsultarAgendamento(),
        'cadastrar_treino': (context) => CadastrarTreino(),
        'consultar_treino': (context) => ConsultarTreino(),
        'feedback': (context) => FeedbackAluno(),
        'consultar_renda': (context) => ConsultarRenda(),
      },
    ),
  );
}
