import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/components/logout.dart';
import 'package:my_trainer/components/text_field_view.dart';

class ConsultarDados extends StatefulWidget {
  const ConsultarDados({Key? key}) : super(key: key);

  @override
  _ConsultarDadosState createState() => _ConsultarDadosState();
}

class _ConsultarDadosState extends State<ConsultarDados> {
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
          'CONSULTAR DADOS',
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
                    return showAthleteData(dados.docs[index]);
                  });
          }
        },
      ),
    );
  }

  showAthleteData(dados) {
    String nome = dados.data()['nome'];
    String codAluno = dados.data()['codAluno'];
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

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            linha3Campos('Nome', nome, 'Código', codAluno, 'Gênero', genero),
            linha3Campos('Idade', idade, 'Peso', peso, 'Altura', altura),
            linha2Campos('Cintura', cintura, 'Quadril', quadril),
            //
            // DOBRAS CUTÂNEAS
            //
            Container(
              margin: EdgeInsets.all(40),
              child: Text('DOBRAS CUTÂNEAS',
                  style: Theme.of(context).textTheme.headline2),
            ),
            linha3Campos('SubEscapular', dobraSubEscapular, 'Tricipital',
                dobraTricipital, 'Peitoral', dobraPeitoral),
            linha3Campos('Axilar Médio', dobraAxilarMedio, 'Supra Ilíaca',
                dobraSupraIliaca, 'Abdômen', dobraAbdomen),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WidgetTextFieldView('Coxa', dobraCoxa),
              ],
            ),
            //
            // PERIMETRIA
            //
            Container(
              margin: EdgeInsets.all(40),
              child: Text('PERIMETRIA',
                  style: Theme.of(context).textTheme.headline2),
            ),
            linha3Campos('Tórax', perimetroTorax, 'Braço Rel',
                perimetroBracoRel, 'Braço Con', perimetroBracoCon),
            linha3Campos('Antrebraços', perimetroAntebraco, 'Abdômen',
                perimetroAbdomen, 'Cintura', perimetroCintura),
            linha3Campos('Quadril', perimetroQuadril, 'Coxas', perimetroCoxas,
                'Panturrilhas', perimetroPanturrilha),
            Container(
              margin: EdgeInsets.all(40),
              child: WidgetTextFieldView('Limitações', limitacoes),
            ),
          ],
        ),
      ),
    );
  }

  linha3Campos(rotulo, variavel, rotulo1, variavel1, rotulo2, variavel2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WidgetTextFieldView(rotulo, variavel),
        WidgetTextFieldView(rotulo1, variavel1),
        WidgetTextFieldView(rotulo2, variavel2),
      ],
    );
  }

  linha2Campos(rotulo, variavel, rotulo1, variavel1) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WidgetTextFieldView(rotulo, variavel),
        WidgetTextFieldView(rotulo1, variavel1),
      ],
    );
  }
}
