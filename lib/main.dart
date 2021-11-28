import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/view/register_page.dart';
import 'package:my_trainer/view/treinador/aluno/alterar_excluir_dados.dart';
import 'package:my_trainer/view/treinador/aluno/cadastrar_dados_aluno.dart';
import 'package:my_trainer/view/treinador/aluno/consultar_aluno.dart';
import 'package:my_trainer/view/treinador/aluno/consultar_dados.dart';
import 'package:my_trainer/view/treinador/home_page.dart';
import 'package:my_trainer/view/treinador/relatorio/feedback.dart';
import 'package:my_trainer/view/treinador/renda/consultar_renda.dart';
import 'package:my_trainer/view/treinador/sessao/agendar.dart';
import 'package:my_trainer/view/treinador/sessao/consultar_sessao.dart';
import 'package:my_trainer/view/treinador/treinos/cadastrar_treino.dart';
import 'package:my_trainer/view/treinador/treinos/consultar_treino.dart';
import 'view/about_page.dart';
import 'view/login_page.dart';

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
            fontSize: 32,
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
        'home_treinador': (context) => HomePage(),
        'register': (context) => RegisterPage(),
        'about': (context) => AboutPage(),
        'cadastrar_dados': (context) => CadastrarDados(),
        'consultar_aluno': (context) => ConsultarAluno(),
        'consultar_dados': (context) => ConsultarDados(),
        'alterar_excluir': (context) => AlterarExcluir(),
        'agendar': (context) => AgendarSessao(),
        'consultar_sessao': (context) => ConsultarSessao(),
        'cadastrar_treino': (context) => CadastrarTreino(),
        'consultar_treino': (context) => ConsultarTreino(),
        'feedback': (context) => RelatorioFeedback(),
        'consultar_renda': (context) => ConsultarRenda(),
      },
    ),
  );
}
