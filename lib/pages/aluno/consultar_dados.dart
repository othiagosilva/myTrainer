import 'package:flutter/material.dart';
import 'package:my_trainer/components/logout.dart';
import 'package:my_trainer/components/text_field_view.dart';
import 'package:my_trainer/model/aluno.dart';

class ConsultarDados extends StatefulWidget {
  const ConsultarDados({Key? key}) : super(key: key);

  @override
  _ConsultarDadosState createState() => _ConsultarDadosState();
}

class _ConsultarDadosState extends State<ConsultarDados> {
  @override
  Widget build(BuildContext context) {
    final Aluno aluno = ModalRoute.of(context)!.settings.arguments as Aluno;
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
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(32.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                linha2Campos(300, 'Nome', aluno.nome, 100, 'Código', ''),
                linha3Campos(
                  120,
                  'Idade',
                  aluno.idade,
                  120,
                  'Peso',
                  aluno.peso,
                  120,
                  'Altura',
                  aluno.altura,
                ),
                linha2Campos(
                  120,
                  'Cintura',
                  aluno.cintura,
                  120,
                  'Quadril',
                  aluno.quadril,
                ),
                //
                // DOBRAS CUTÂNEAS
                //
                Container(
                  margin: EdgeInsets.all(40),
                  child: Text('DOBRAS CUTÂNEAS',
                      style: Theme.of(context).textTheme.headline2),
                ),
                linha3Campos(
                  135,
                  'SubEscapular',
                  aluno.dobraSubEscapular,
                  135,
                  'Tricipital',
                  aluno.dobraTricipital,
                  135,
                  'Peitoral',
                  aluno.dobraPeitoral,
                ),
                linha3Campos(
                  135,
                  'Axilar Médio',
                  aluno.dobraAxilarMedio,
                  135,
                  'Supra Ilíaca',
                  aluno.dobraSupraIliaca,
                  135,
                  'Abdômen',
                  aluno.dobraAbdomen,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WidgetTextFieldView('Coxa', aluno.dobraCoxa),
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
                linha3Campos(
                  120,
                  'Tórax',
                  aluno.perimetroTorax,
                  120,
                  'Braço Rel',
                  aluno.perimetroBracoRel,
                  120,
                  'Braço Con',
                  aluno.perimetroBracoCon,
                ),
                linha3Campos(
                  120,
                  'Antrebraços',
                  aluno.perimetroAntebraco,
                  120,
                  'Abdômen',
                  aluno.perimetroAbdomen,
                  120,
                  'Cintura',
                  aluno.perimetroCintura,
                ),
                linha3Campos(
                  120,
                  'Quadril',
                  aluno.perimetroQuadril,
                  120,
                  'Coxas',
                  aluno.perimetroCoxas,
                  120,
                  'Panturrilhas',
                  aluno.perimetroPanturrilha,
                ),
                Container(
                  margin: EdgeInsets.all(40),
                  child: WidgetTextFieldView('Limitações', aluno.limitacoes),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  linha3Campos(tamanho, rotulo, variavel, tamanho1, rotulo1, variavel1,
      tamanho2, rotulo2, variavel2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WidgetTextFieldView(rotulo, variavel),
        WidgetTextFieldView(rotulo, variavel),
        WidgetTextFieldView(rotulo, variavel),
      ],
    );
  }

  linha2Campos(tamanho, rotulo, variavel, tamanho1, rotulo1, variavel1) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WidgetTextFieldView(rotulo, variavel),
        WidgetTextFieldView(rotulo, variavel),
      ],
    );
  }
}
