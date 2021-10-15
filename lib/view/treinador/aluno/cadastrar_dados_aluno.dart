import 'package:flutter/material.dart';
import 'package:my_trainer/widgets/widget_textField.dart';
import 'package:my_trainer/view/treinador/aluno/dados_aluno.dart';

class CadastrarDados extends StatefulWidget {
  const CadastrarDados({Key? key}) : super(key: key);

  @override
  _CadastrarDadosState createState() => _CadastrarDadosState();
}

class _CadastrarDadosState extends State<CadastrarDados> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var cod = 1;
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
  Aluno aluno = new Aluno();

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
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'login');
              },
              icon: Icon(
                Icons.logout,
                size: 32,
              ),
            ),
          ),
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
                  child: WidgetTextField('Limitações', limitacoes),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       width: 120,
                //       child: WidgetTextField('IMC', imc),
                //     ),
                //     Container(
                //       width: 120,
                //       child: WidgetTextField('Razão CQ', razaoCinturaQuadril),
                //     ),
                //     Container(
                //       width: 120,
                //       child: WidgetTextField('% Gordura', percentualGordura),
                //     ),
                //   ],
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       width: 140,
                //       child: WidgetTextField('Massa Magra', massaMagra),
                //     ),
                //     Container(
                //       width: 140,
                //       child: WidgetTextField('Massa Gorda', massaGorda),
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
            aluno.cod = cod.toString();
            aluno.nome = (nome.text);
            aluno.idade = (idade.text);
            aluno.peso = (peso.text);
            aluno.altura = (altura.text);
            aluno.cintura = (cintura.text);
            aluno.quadril = (quadril.text);
            aluno.perimetroAbdomen = (perimetroAbdomen.text);
            aluno.dobraSubEscapular = (dobraSubEscapular.text);
            aluno.dobraTricipital = (dobraTricipital.text);
            aluno.dobraPeitoral = (dobraPeitoral.text);
            aluno.dobraAxilarMedio = (dobraAxilarMedio.text);
            aluno.dobraSupraIliaca = (dobraSupraIliaca.text);
            aluno.dobraAbdomen = (dobraAbdomen.text);
            aluno.dobraCoxa = (dobraCoxa.text);
            aluno.perimetroTorax = (perimetroTorax.text);
            aluno.perimetroBracoRel = (perimetroBracoRel.text);
            aluno.perimetroBracoCon = (perimetroBracoCon.text);
            aluno.perimetroAntebraco = (perimetroAntebraco.text);
            aluno.perimetroCintura = (perimetroCintura.text);
            aluno.perimetroQuadril = (perimetroQuadril.text);
            aluno.perimetroCoxas = (perimetroCoxas.text);
            aluno.perimetroPanturrilha = (perimetroPanturrilha.text);
            aluno.limitacoes = (limitacoes.text);
            aluno.genero = (genero);
            cod++;
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
            Theme.of(context).accentColor,
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
      child: WidgetTextField(rotulo, variavel),
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
