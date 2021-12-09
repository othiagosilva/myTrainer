import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/widgets/widget_Logout.dart';
import 'package:my_trainer/widgets/widget_CampoTexto.dart';

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
  int codAluno = 1;

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
                      WidgetCampoTexto('Nome', nome),
                      linha3Campos(
                        120,
                        'Idade',
                        idade,
                        120,
                        'Peso',
                        peso,
                        120,
                        'Altura',
                        altura,
                      ),
                      //
                      // CONSTRUÇÃO DOS RADIOS.
                      //
                      Container(
                        margin: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: Row(
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
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
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
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                linha2Campos(120, 'Cintura', cintura, 120, 'Quadril', quadril),
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
                    dobraSubEscapular,
                    135,
                    'Tricipital',
                    dobraTricipital,
                    135,
                    'Peitoral',
                    dobraPeitoral),
                linha3Campos(
                    135,
                    'Axilar Médio',
                    dobraAxilarMedio,
                    135,
                    'Supra Ilíaca',
                    dobraSupraIliaca,
                    135,
                    'Abdômen',
                    dobraAbdomen),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    campo(135, 'Coxa', dobraCoxa),
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
                linha3Campos(120, 'Tórax', perimetroTorax, 120, 'Braço Rel',
                    perimetroBracoRel, 120, 'Braço Con', perimetroBracoCon),
                linha3Campos(
                    120,
                    'Antrebraços',
                    perimetroAntebraco,
                    120,
                    'Abdômen',
                    perimetroAbdomen,
                    120,
                    'Cintura',
                    perimetroCintura),
                linha3Campos(120, 'Quadril', perimetroQuadril, 120, 'Coxas',
                    perimetroCoxas, 120, 'Panturrilhas', perimetroPanturrilha),
                Container(
                  margin: EdgeInsets.all(40),
                  child: WidgetCampoTexto('Limitações', limitacoes),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       width: 120,
                //       child: WidgetCampoTexto('IMC', imc),
                //     ),
                //     Container(
                //       width: 120,
                //       child: WidgetCampoTexto('Razão CQ', razaoCinturaQuadril),
                //     ),
                //     Container(
                //       width: 120,
                //       child: WidgetCampoTexto('% Gordura', percentualGordura),
                //     ),
                //   ],
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       width: 140,
                //       child: WidgetCampoTexto('Massa Magra', massaMagra),
                //     ),
                //     Container(
                //       width: 140,
                //       child: WidgetCampoTexto('Massa Gorda', massaGorda),
                //     ),
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    botaoCadastrar(),
                    botaoCancelar(),
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
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        child: Text(
          'Cadastrar',
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
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Aluno Cadastrado com sucesso',
                  style: Theme.of(context).textTheme.headline3,
                ),
                duration: Duration(seconds: 2),
              ),
            );
            Navigator.pop(context);
          }
        },
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

  campo(tamanho, rotulo, variavel) {
    return Container(
      width: tamanho,
      child: WidgetCampoTexto(rotulo, variavel),
    );
  }

  linha3Campos(tamanho, rotulo, variavel, tamanho1, rotulo1, variavel1,
      tamanho2, rotulo2, variavel2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        campo(tamanho, rotulo, variavel),
        campo(tamanho1, rotulo1, variavel1),
        campo(tamanho2, rotulo2, variavel2),
      ],
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
