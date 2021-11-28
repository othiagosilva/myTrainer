import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/widgets/widget_NavegationButton.dart';
import 'package:my_trainer/widgets/widget_Logout.dart';

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
    final emailLogado = ModalRoute.of(context)!.settings.arguments;

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
          Container(
            child: Column(
              children: [
                viewHome2Button(16, 24, 'Alunos', 'Cadastrar',
                    'cadastrar_dados', 'Consultar', 'consultar_aluno'),
                viewHome2Button(0, 40, 'Agendamento', 'Agendar', 'agendar',
                    'Consultar', 'consultar_sessao'),
                viewHome2Button(0, 40, 'Treinos', 'Cadastrar',
                    'cadastrar_treino', 'Consultar', 'consultar_treino'),
                viewHome1Button(0, 40, 'Relatórios', 'Feedback', 'feedback'),
                viewHome1Button(0, 0, 'Renda', 'Consultar', 'consultar_renda'),
              ],
            ),
          ),
        ],
      ),
    );
  }

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

  viewHome2Button(margem1, margem2, titulo, tituloBotao1, paginaBotao1,
      tituloBotao2, paginaBotao2) {
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
          WidgetNavegationButton(
            tituloBotao2,
            Theme.of(context).colorScheme.secondary,
            proximaPag: paginaBotao2,
          ),
        ],
      ),
    );
  }

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
}
