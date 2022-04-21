import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/components/logout.dart';
import 'package:my_trainer/components/my_buttons.dart';
import 'package:my_trainer/components/show_dialog.dart';
import 'package:my_trainer/components/show_message.dart';
import 'package:my_trainer/model/aluno.dart';

class ConsultarAluno extends StatefulWidget {
  const ConsultarAluno({Key? key}) : super(key: key);

  @override
  _ConsultarAlunoState createState() => _ConsultarAlunoState();
}

class _ConsultarAlunoState extends State<ConsultarAluno> {
  late CollectionReference alunos;

  @override
  void initState() {
    super.initState();

    alunos = FirebaseFirestore.instance.collection('alunos');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CONSULTAR ALUNO',
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
      body: StreamBuilder<QuerySnapshot>(
        stream: alunos.snapshots(),
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
                    return exibirItemColecao(dados.docs[index]);
                  });
          }
        },
      ),
    );
  }

  exibirItemColecao(dados) {
    String nome = dados.data()['nome'];
    String idade = dados.data()['idade'];
    String peso = dados.data()['peso'];
    String altura = dados.data()['altura'];
    String genero = dados.data()['genero'];
    String cintura = dados.data()['cintura'];
    String quadril = dados.data()['quadril'];
    String dobraSubEscapular = dados.data()['dobraSubEscapular'];
    String dobraTricipital = dados.data()['dobraTricipital'];
    String dobraPeitoral = dados.data()['dobraPeitoral'];
    String dobraAxilarMedio = dados.data()['dobraAxilarMedio'];
    String dobraSupraIliaca = dados.data()['dobraSupraIliaca'];
    String dobraAbdomen = dados.data()['dobraAbdomen'];
    String dobraCoxa = dados.data()['dobraCoxa'];
    String perimetroAbdomen = dados.data()['perimetroAbdomen'];
    String perimetroTorax = dados.data()['perimetroTorax'];
    String perimetroBracoRel = dados.data()['perimetroBracoRel'];
    String perimetroBracoCon = dados.data()['perimetroBracoCon'];
    String perimetroAntebraco = dados.data()['perimetroAntebraco'];
    String perimetroCintura = dados.data()['perimetroCintura'];
    String perimetroQuadril = dados.data()['perimetroQuadril'];
    String perimetroCoxas = dados.data()['perimetroCoxas'];
    String perimetroPanturrilha = dados.data()['perimetroPanturrilha'];
    String limitacoes = dados.data()['limitacoes'];

    Aluno aluno = new Aluno(
        nome,
        idade,
        peso,
        altura,
        genero,
        cintura,
        quadril,
        dobraSubEscapular,
        dobraTricipital,
        dobraPeitoral,
        dobraAxilarMedio,
        dobraSupraIliaca,
        dobraAbdomen,
        dobraCoxa,
        perimetroAbdomen,
        perimetroTorax,
        perimetroBracoRel,
        perimetroBracoCon,
        perimetroAntebraco,
        perimetroCintura,
        perimetroQuadril,
        perimetroCoxas,
        perimetroPanturrilha,
        limitacoes);

    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                padding: EdgeInsets.all(5),
                width: 200,
                child: Text(nome, style: Theme.of(context).textTheme.headline5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ],
          ),
          Column(
            children: [botaoIcone(Icons.edit, 'alterar_dados', aluno)],
          ),
          Column(
            children: [botaoIcone(Icons.search, 'consultar_dados', aluno)],
          ),
          Column(
            children: [botaoExcluir(dados, nome)],
          ),
        ],
      ),
    );
  }

  botaoIcone(icone, rota, aluno) {
    return Container(
      child: IconButton(
        icon: Icon(
          icone,
          size: 32,
        ),
        color: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.pushNamed(
            context,
            rota,
            arguments: aluno,
          );
        },
      ),
    );
  }

  botaoExcluir(data, nome) {
    return Container(
      child: IconButton(
          icon: Icon(
            Icons.delete,
            size: 32,
          ),
          color: Theme.of(context).primaryColor,
          onPressed: () {
            myShowDialog(excludeAthletePopUpContent(data, nome), context);
          }),
    );
  }

  excludeAthletePopUpContent(data, nome) {
    return Container(
      height: 150,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 32),
            child: Text(
              'Deseja excluir ' + nome + '?',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              confirmDeletionButton(data),
              cancelButton(context),
            ],
          )
        ],
      ),
    );
  }

  confirmAlterButton(data, id) {
    return ElevatedButton(
      child: buttonLabel('Confirmar'),
      style: confirmButtonStyle(context),
      onPressed: () {
        alunos.doc(data.id).delete();
        Navigator.pop(context);
      },
    );
  }

  confirmDeletionButton(dados) {
    return ElevatedButton(
      child: buttonLabel('Confirmar'),
      style: confirmButtonStyle(context),
      onPressed: () {
        setState(() {
          alunos.doc(dados.id).delete();
          Navigator.pop(context);
          showMessage('Renda removida com sucesso', context);
        });
      },
    );
  }
}
