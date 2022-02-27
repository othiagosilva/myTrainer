import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/components/logout.dart';
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
    String perimetroAbdomen = dados.data()['perimetroAbdomen'];
    String dobraSubEscapular = dados.data()['dobraSubEscapular'];
    String dobraTricipital = dados.data()['dobraTricipital'];
    String dobraPeitoral = dados.data()['dobraPeitoral'];
    String dobraAxilarMedio = dados.data()['dobraAxilarMedio'];
    String dobraSupraIliaca = dados.data()['dobraSupraIliaca'];
    String dobraAbdomen = dados.data()['dobraAbdomen'];
    String dobraCoxa = dados.data()['dobraCoxa'];
    String perimetroTorax = dados.data()['perimetroTorax'];
    String perimetroBracoRel = dados.data()['perimetroBracoRel'];
    String perimetroBracoCon = dados.data()['perimetroBracoCon'];
    String perimetroAntebraco = dados.data()['perimetroAntebraco'];
    String perimetroCintura = dados.data()['perimetroCintura'];
    String perimetroQuadril = dados.data()['perimetroQuadril'];
    String perimetroCoxas = dados.data()['perimetroCoxas'];
    String perimetroPanturrilha = dados.data()['perimetroPanturrilha'];
    String limitacoes = dados.data()['limitacoes'];

    Aluno aluno = new Aluno(nome, idade, peso, altura, genero);

    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Column(
            children: [
              Container(
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

  botaoCancelar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        child: Text(
          'Não',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).colorScheme.secondary,
          ),
          elevation: MaterialStateProperty.all<double>(0),
          fixedSize: MaterialStateProperty.all<Size>(
            Size(100, 50),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  botaoIcone(icone, rota, dados) {
    Aluno aluno = new Aluno(
        dados.nome, dados.idade, dados.peso, dados.altura, dados.genero);
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

  botaoExcluir(aluno, nome) {
    return Container(
      child: IconButton(
          icon: Icon(
            Icons.delete,
            size: 32,
          ),
          color: Theme.of(context).primaryColor,
          onPressed: () {
            mensagemConfirmacao(aluno, nome);
          }),
    );
  }

  mensagemConfirmacao(aluno, nome) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          backgroundColor: Color.fromRGBO(238, 238, 238, 1),
          content: Text(
            'Deseja excluir ' + nome + '?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Colors.black,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: ElevatedButton(
                    child: Text(
                      'Sim',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor,
                      ),
                      elevation: MaterialStateProperty.all<double>(0),
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size(100, 50),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        alunos.doc(aluno.id).delete();
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Aluno removido com sucesso'),
                          duration: Duration(seconds: 2),
                        ));
                      });
                    },
                  ),
                ),
                botaoCancelar(),
              ],
            ),
          ],
        );
      },
    );
  }
}
