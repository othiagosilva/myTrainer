import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/widgets/widget_Logout.dart';

import 'dados_aluno.dart';

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
          }),
    );
  }

  exibirItemColecao(dados) {
    String cod = dados.data()['codAluno'];
    String nome = dados.data()['nome'];
    String idade = dados.data()['idade'];
    String peso = dados.data()['peso'];
    String altura = dados.data()['altura'];
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
    String genero = dados.data()['genero'];

    Aluno aluno = new Aluno(
        cod,
        nome,
        idade,
        peso,
        altura,
        cintura,
        quadril,
        perimetroAbdomen,
        dobraSubEscapular,
        dobraTricipital,
        dobraPeitoral,
        dobraAxilarMedio,
        dobraSupraIliaca,
        dobraAbdomen,
        dobraCoxa,
        perimetroTorax,
        perimetroBracoRel,
        perimetroBracoCon,
        perimetroAntebraco,
        perimetroCintura,
        perimetroQuadril,
        perimetroCoxas,
        perimetroPanturrilha,
        limitacoes,
        genero);

    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          //
          // CABEÇALHO
          //
          Row(
            children: [
              Container(
                width: 235,
                child: Text(
                  'Nome',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              Text(
                'Cód',
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
          //
          // DADOS
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                width: 210,
                child: Text(
                  nome,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                width: 50,
                child: Text(
                  cod,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              botaoIcone(Icons.edit, 'alterar_excluir', aluno),
              botaoIcone(Icons.search, 'consultar_dados', aluno),
              botaoExcluir(dados, nome),
            ],
          )
        ],
      ),
    );
  }

  botaoCancelar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        child: Text(
          'Cancelar',
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
            Size(200, 50),
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
        dados.cod,
        dados.nome,
        dados.idade,
        dados.peso,
        dados.altura,
        dados.cintura,
        dados.quadril,
        dados.perimetroAbdomen,
        dados.dobraSubEscapular,
        dados.dobraTricipital,
        dados.dobraPeitoral,
        dados.dobraAxilarMedio,
        dados.dobraSupraIliaca,
        dados.dobraAbdomen,
        dados.dobraCoxa,
        dados.perimetroTorax,
        dados.perimetroBracoRel,
        dados.perimetroBracoCon,
        dados.perimetroAntebraco,
        dados.perimetroCintura,
        dados.perimetroQuadril,
        dados.perimetroCoxas,
        dados.perimetroPanturrilha,
        dados.limitacoes,
        dados.genero);
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
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: ElevatedButton(
                child: Text(
                  'Confirmar',
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
                    Size(200, 50),
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
        );
      },
    );
  }
}
