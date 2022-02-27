import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/components/navegation_button.dart';
import 'package:my_trainer/components/logout.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CollectionReference usuarios;

  @override
  void initState() {
    super.initState();
    usuarios = FirebaseFirestore.instance.collection('usuarios');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: username(),
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

  username() {
    return Container(
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
                      return getUser(dados.docs[index]);
                    });
            }
          }),
    );
  }

  getUser(dados) {
    String email = dados.data()['email'];
    String usuario = dados.data()['usuario'];
    String permissao = dados.data()['permissao'];
    String permissaoUsuario = 'treinador';
    var sessao = FirebaseAuth.instance.currentUser;

    if (email == sessao?.email) {
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
    } else {
      return Text(
        'Usuário não encontrado',
        style: TextStyle(fontSize: 16),
      );
    }
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
