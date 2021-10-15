import 'package:flutter/material.dart';
import 'package:my_trainer/view/treinador/aluno/dados_aluno.dart';

class AlterarExcluir extends StatefulWidget {
  const AlterarExcluir({Key? key}) : super(key: key);

  @override
  _AlterarExcluirState createState() => _AlterarExcluirState();
}

class _AlterarExcluirState extends State<AlterarExcluir> {
  @override
  Widget build(BuildContext context) {
    final Aluno aluno = ModalRoute.of(context)!.settings.arguments as Aluno;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ALTERAR/EXCLUIR',
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
                txt('Nome', aluno.nome),
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
                linha2Campos(120, 'Cintura', aluno.cintura, 120, 'Quadril',
                    aluno.quadril),
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
                    campo(135, 'Coxa', aluno.dobraCoxa),
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
                  child: txt('Limitações', aluno.limitacoes),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    botaoConfirmar(aluno),
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

  botaoConfirmar(aluno) {
    return Container(
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
          aluno.nome = (aluno.nome);
          aluno.idade = (aluno.idade);
          aluno.peso = (aluno.peso);
          aluno.altura = (aluno.altura);
          aluno.cintura = (aluno.cintura);
          aluno.quadril = (aluno.quadril);
          aluno.perimetroAbdomen = (aluno.perimetroAbdomen);
          aluno.dobraSubEscapular = (aluno.dobraSubEscapular);
          aluno.dobraTricipital = (aluno.dobraTricipital);
          aluno.dobraPeitoral = (aluno.dobraPeitoral);
          aluno.dobraAxilarMedio = (aluno.dobraAxilarMedio);
          aluno.dobraSupraIliaca = (aluno.dobraSupraIliaca);
          aluno.dobraAbdomen = (aluno.dobraAbdomen);
          aluno.dobraCoxa = (aluno.dobraCoxa);
          aluno.perimetroTorax = (aluno.perimetroTorax);
          aluno.perimetroBracoRel = (aluno.perimetroBracoRel);
          aluno.perimetroBracoCon = (aluno.perimetroBracoCon);
          aluno.perimetroAntebraco = (aluno.perimetroAntebraco);
          aluno.perimetroCintura = (aluno.perimetroCintura);
          aluno.perimetroQuadril = (aluno.perimetroQuadril);
          aluno.perimetroCoxas = (aluno.perimetroCoxas);
          aluno.perimetroPanturrilha = (aluno.perimetroPanturrilha);
          aluno.limitacoes = (aluno.limitacoes);
          aluno.genero = (aluno.genero);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Dados Alterados com sucesso',
                style: Theme.of(context).textTheme.headline3,
              ),
              duration: Duration(seconds: 2),
            ),
          );
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

  txt(rotulo, variavel) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Text(
            rotulo,
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
          TextFormField(
            style: Theme.of(context).textTheme.headline5,
            controller: TextEditingController(text: variavel),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ],
      ),
    );
  }

  campo(tamanho, rotulo, variavel) {
    return Container(
      width: tamanho,
      child: txt(rotulo, variavel),
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
