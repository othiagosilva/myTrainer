import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/widgets/widget_NavegationButton.dart';
import 'package:my_trainer/widgets/widget_logout.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //*
  //* Connection to Firebase
  //*
  late CollectionReference usuarios;

  @override
  void initState() {
    super.initState();
    usuarios = FirebaseFirestore.instance.collection('usuarios');
  }

  @override
  Widget build(BuildContext context) {
    //*
    //* Get logon email
    //*
    final emailLogado = ModalRoute.of(context)!.settings.arguments;
    //*
    //* View
    //*
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
          padding: EdgeInsets.fromLTRB(0, 14, 0, 0),
          child: StreamBuilder<QuerySnapshot>(
              stream: usuarios.snapshots(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Center(
                      child: Text('Não foi possível conectar ao Firestore'),
                    );
                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  default:
                    final dados = snapshot.requireData;
                    return ListView.builder(
                        itemCount: dados.size,
                        itemBuilder: (context, index) {
                          return getUser(dados.docs[index], emailLogado);
                        });
                }
              }),
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
              viewHome1Button(
                  16.0, 0.0, 'Alunos', 'Consultar', 'consultar_aluno'),
              WidgetNavegationButton(
                  'Cadastrar', Theme.of(context).colorScheme.secondary,
                  proximaPag: 'cadastrar_aluno'),
              //*
              //* Agendamento
              //*
              viewHome1Button(0.0, 40.0, 'Agendamento', 'Agendar', 'agendar'),
              WidgetNavegationButton(
                  'Consultar', Theme.of(context).colorScheme.secondary,
                  proximaPag: 'consultar_agendamento'),
              //*
              //* Treinos
              //*
              viewHome1Button(
                  0.0, 40.0, 'Treinos', 'Consultar', 'consultar_treino'),
              WidgetNavegationButton(
                  'Cadastrar', Theme.of(context).colorScheme.secondary,
                  proximaPag: 'cadastrar_treino'),
              //*
              //* Relatórios
              //*
              viewHome1Button(0.0, 40.0, 'Relatórios', 'Feedback', 'feedback'),
              //*
              //* Renda
              //*
              viewHome1Button(
                  0.0, 0.0, 'Renda', 'Consultar', 'consultar_renda'),
            ],
          ),
        ],
      ),
    );
  }

  //*
  //* Model
  //*
  getUser(dados, emailLogado) {
    String email = dados.data()['email'];
    String usuario = dados.data()['usuario'];
    String permissao = dados.data()['permissao'];
    String permissaoUsuario = 'treinador';

    if (email == emailLogado) {
      if (permissao == 'a') {
        permissaoUsuario = 'aluno';
      }
      return Column(
        children: [
          Text(
            usuario,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            permissaoUsuario,
            style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      );
    }
  }

  //*
  //* Functions
  //*
  viewHome1Button(margem1, margem2, titulo, tituloBotao1, paginaBotao1) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, margem1, 0, margem2),
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
