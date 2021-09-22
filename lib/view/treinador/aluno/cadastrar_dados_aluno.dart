import 'package:flutter/material.dart';
import 'package:my_trainer/widgets/widget_myButton.dart';
import 'package:my_trainer/widgets/widget_textField.dart';

class CadastrarDados extends StatefulWidget {
  const CadastrarDados({Key? key}) : super(key: key);

  @override
  _CadastrarDadosState createState() => _CadastrarDadosState();
}

class _CadastrarDadosState extends State<CadastrarDados> {
  var codigo;
  var nome;
  var idade;
  var peso;
  var altura;
  var cintura;
  var quadril;
  var perimetroAbdomen;
  var dobraSubEscapular;
  var dobraTricipital;
  var dobraPeitoral;
  var dobraAxilarMedio;
  var dobraSupraIliaca;
  var dobraAbdomen;
  var dobraCoxa;
  var somaDobra;
  var perimetroTorax;
  var perimetroBracoRel;
  var perimetroBracoCon;
  var perimetroAntebraco;
  var perimetroCintura;
  var perimetroQuadril;
  var perimetroCoxas;
  var perimetroPanturrilha;
  var limitacoes;
  var imc;
  var razaoCinturaQuadril;
  var percentualGordura;
  var massaMagra;
  var massaGorda;
  String genero = 'm';

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
                WidgetTextField('Nome', nome),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 120,
                      child: WidgetTextField('Idade', idade),
                    ),
                    Container(
                      width: 120,
                      child: WidgetTextField('Peso', peso),
                    ),
                    Container(
                      width: 120,
                      child: WidgetTextField('Altura', altura),
                    ),
                  ],
                ),
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
                              style: Theme.of(context).textTheme.headline6,
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
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 120,
                      child: WidgetTextField('Cintura', cintura),
                    ),
                    Container(
                      width: 120,
                      child: WidgetTextField('Quadril', quadril),
                    ),
                    Container(
                      width: 120,
                      child: WidgetTextField('Abdômen', perimetroAbdomen),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(40),
                  child: Text('DOBRAS CUTÂNEAS',
                      style: Theme.of(context).textTheme.headline2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 135,
                      child: WidgetTextField('SubEscapular', dobraSubEscapular),
                    ),
                    Container(
                      width: 135,
                      child: WidgetTextField('Tricipital', dobraTricipital),
                    ),
                    Container(
                      width: 135,
                      child: WidgetTextField('Peitoral', dobraPeitoral),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 135,
                      child: WidgetTextField('Axilar Médio', dobraAxilarMedio),
                    ),
                    Container(
                      width: 135,
                      child: WidgetTextField('Supra Ilíaca', dobraSupraIliaca),
                    ),
                    Container(
                      width: 135,
                      child: WidgetTextField('Abdômen', dobraAbdomen),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 135,
                      child: WidgetTextField('Coxa', dobraCoxa),
                    ),
                    Container(
                      width: 135,
                      child: WidgetTextField('Soma', somaDobra),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(40),
                  child: Text('PERIMETRIA',
                      style: Theme.of(context).textTheme.headline2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 120,
                      child: WidgetTextField('Tórax', perimetroTorax),
                    ),
                    Container(
                      width: 120,
                      child: WidgetTextField('Braço Rel', perimetroBracoRel),
                    ),
                    Container(
                      width: 120,
                      child: WidgetTextField('Braço Con', perimetroBracoCon),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 120,
                      child: WidgetTextField('Antrebraços', perimetroAntebraco),
                    ),
                    Container(
                      width: 120,
                      child: WidgetTextField('Abdômen', perimetroAbdomen),
                    ),
                    Container(
                      width: 120,
                      child: WidgetTextField('Cintura', perimetroCintura),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 120,
                      child: WidgetTextField('Quadril', perimetroQuadril),
                    ),
                    Container(
                      width: 120,
                      child: WidgetTextField('Coxas', perimetroCoxas),
                    ),
                    Container(
                      width: 120,
                      child:
                          WidgetTextField('Panturrilhas', perimetroPanturrilha),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(40),
                  child: WidgetTextField('Limitações', limitacoes),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 120,
                      child: WidgetTextField('IMC', imc),
                    ),
                    Container(
                      width: 120,
                      child: WidgetTextField('Razão CQ', razaoCinturaQuadril),
                    ),
                    Container(
                      width: 120,
                      child: WidgetTextField('% Gordura', percentualGordura),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 120,
                      child: WidgetTextField('Massa Magra', massaMagra),
                    ),
                    Container(
                      width: 120,
                      child: WidgetTextField('Massa Gorda', massaGorda),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WidgetMyButton(
                      'Cadastrar',
                      Theme.of(context).primaryColor,
                    ),
                    WidgetMyButton(
                      'Cancelar',
                      Theme.of(context).accentColor,
                      proximaPag: 'home',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
