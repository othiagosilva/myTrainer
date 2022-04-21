import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/components/logout.dart';
import 'package:my_trainer/components/my_buttons.dart';
import 'package:my_trainer/components/show_message.dart';
import 'package:my_trainer/components/text_field.dart';

class CadastrarDados extends StatefulWidget {
  const CadastrarDados({Key? key}) : super(key: key);

  @override
  _CadastrarDadosState createState() => _CadastrarDadosState();
}

class _CadastrarDadosState extends State<CadastrarDados> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nome = TextEditingController();
  TextEditingController idade = TextEditingController();
  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();
  TextEditingController cintura = TextEditingController();
  TextEditingController quadril = TextEditingController();
  TextEditingController perimetroAbdomen = TextEditingController();
  TextEditingController dobraSubEscapular = TextEditingController();
  TextEditingController dobraTricipital = TextEditingController();
  TextEditingController dobraPeitoral = TextEditingController();
  TextEditingController dobraAxilarMedio = TextEditingController();
  TextEditingController dobraSupraIliaca = TextEditingController();
  TextEditingController dobraAbdomen = TextEditingController();
  TextEditingController dobraCoxa = TextEditingController();
  TextEditingController perimetroTorax = TextEditingController();
  TextEditingController perimetroBracoRel = TextEditingController();
  TextEditingController perimetroBracoCon = TextEditingController();
  TextEditingController perimetroAntebraco = TextEditingController();
  TextEditingController perimetroCintura = TextEditingController();
  TextEditingController perimetroQuadril = TextEditingController();
  TextEditingController perimetroCoxas = TextEditingController();
  TextEditingController perimetroPanturrilha = TextEditingController();
  TextEditingController limitacoes = TextEditingController();
  var genero = 'm';
  late int codAluno;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CADASTRAR DADOS',
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
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      WidgetTextField('Nome', nome),
                      linha3Campos(
                        100.0,
                        'Idade',
                        idade,
                        100.0,
                        'Peso',
                        peso,
                        100.0,
                        'Altura',
                        altura,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: "m",
                                  groupValue: genero,
                                  onChanged: (value) {
                                    setState(() {
                                      genero = value.toString();
                                    });
                                  },
                                  fillColor: MaterialStateProperty.all<Color>(
                                    Theme.of(context).primaryColor,
                                  ),
                                ),
                                Text(
                                  'Masculino',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: "f",
                                  groupValue: genero,
                                  onChanged: (value) {
                                    setState(() {
                                      genero = value.toString();
                                    });
                                  },
                                  fillColor: MaterialStateProperty.all<Color>(
                                    Theme.of(context).primaryColor,
                                  ),
                                ),
                                Text(
                                  'Feminino',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                linha2Campos(
                    100.0, 'Cintura', cintura, 100.0, 'Quadril', quadril),
                Container(
                  margin: EdgeInsets.all(40.0),
                  child: Text('DOBRAS CUTÂNEAS',
                      style: Theme.of(context).textTheme.headline2),
                ),
                linha3Campos(
                    100.0,
                    'Subescap',
                    dobraSubEscapular,
                    100.0,
                    'Tricipital',
                    dobraTricipital,
                    100.0,
                    'Peitoral',
                    dobraPeitoral),
                linha3Campos(
                    100.0,
                    'Ax Médio',
                    dobraAxilarMedio,
                    100.0,
                    'Sup Ilíaca',
                    dobraSupraIliaca,
                    100.0,
                    'Abdômen',
                    dobraAbdomen),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    campo(100.0, 'Coxa', dobraCoxa),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(40.0),
                  child: Text('PERIMETRIA',
                      style: Theme.of(context).textTheme.headline2),
                ),
                linha3Campos(100.0, 'Tórax', perimetroTorax, 100.0, 'Braço R',
                    perimetroBracoRel, 100.0, 'Braço C', perimetroBracoCon),
                linha3Campos(
                    100.0,
                    'Antbraço',
                    perimetroAntebraco,
                    100.0,
                    'Abdômen',
                    perimetroAbdomen,
                    100.0,
                    'Cintura',
                    perimetroCintura),
                linha3Campos(100.0, 'Quadril', perimetroQuadril, 100.0, 'Coxas',
                    perimetroCoxas, 100.0, 'Pant.', perimetroPanturrilha),
                Container(
                  margin: EdgeInsets.all(16.0),
                  child: WidgetTextField('Limitações', limitacoes),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    botaoCadastrar(),
                    cancelButton(context),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  botaoCadastrar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        child: buttonLabel('Cadastrar'),
        style: confirmButtonStyle(context),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            FirebaseFirestore.instance.collection("alunos").doc(nome.text).set({
              "codAluno": codAluno.toString(),
              "nome": nome.text,
              "idade": (idade.text),
              "peso": (peso.text),
              "altura": (altura.text),
              "cintura": (cintura.text),
              "quadril": (quadril.text),
              "perimetroAbdomen": (perimetroAbdomen.text),
              "dobraSubEscapular": (dobraSubEscapular.text),
              "dobraTricipital": (dobraTricipital.text),
              "dobraPeitoral": (dobraPeitoral.text),
              "dobraAxilarMedio": (dobraAxilarMedio.text),
              "dobraSupraIliaca": (dobraSupraIliaca.text),
              "dobraAbdomen": (dobraAbdomen.text),
              "dobraCoxa": (dobraCoxa.text),
              "perimetroTorax": (perimetroTorax.text),
              "perimetroBracoRel": (perimetroBracoRel.text),
              "perimetroBracoCon": (perimetroBracoCon.text),
              "perimetroAntebraco": (perimetroAntebraco.text),
              "perimetroCintura": (perimetroCintura.text),
              "perimetroQuadril": (perimetroQuadril.text),
              "perimetroCoxas": (perimetroCoxas.text),
              "perimetroPanturrilha": (perimetroPanturrilha.text),
              "limitacoes": (limitacoes.text),
              "genero": (genero)
            });
            codAluno++;
            setState(() {
              nome.text = "";
              idade.text = "";
              peso.text = "";
              altura.text = "";
              cintura.text = "";
              quadril.text = "";
              perimetroAbdomen.text = "";
              dobraSubEscapular.text = "";
              dobraTricipital.text = "";
              dobraPeitoral.text = "";
              dobraAxilarMedio.text = "";
              dobraSupraIliaca.text = "";
              dobraAbdomen.text = "";
              dobraCoxa.text = "";
              perimetroTorax.text = "";
              perimetroBracoRel.text = "";
              perimetroBracoCon.text = "";
              perimetroAntebraco.text = "";
              perimetroCintura.text = "";
              perimetroQuadril.text = "";
              perimetroCoxas.text = "";
              perimetroPanturrilha.text = "";
              limitacoes.text = "";
              genero = "m";
              FocusScope.of(context).unfocus();
            });
            showMessage('Aluno Cadastrado', context);
            Navigator.pop(context);
          }
        },
      ),
    );
  }

  campo(tamanho, rotulo, variavel) {
    return Container(
      width: tamanho,
      child: WidgetTextField(rotulo, variavel),
    );
  }

  linha3Campos(tamanho, rotulo, variavel, tamanho1, rotulo1, variavel1,
      tamanho2, rotulo2, variavel2) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          campo(tamanho, rotulo, variavel),
          campo(tamanho1, rotulo1, variavel1),
          campo(tamanho2, rotulo2, variavel2),
        ],
      ),
    );
  }

  linha2Campos(tamanho, rotulo, variavel, tamanho1, rotulo1, variavel1) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        campo(tamanho, rotulo, variavel),
        campo(tamanho1, rotulo1, variavel1),
      ],
    );
  }
}
