import 'package:flutter/material.dart';
import 'package:my_trainer/pages/treinador/feedback/relatorio.dart';
import 'package:my_trainer/widgets/widget_logout.dart';

class FeedbackAluno extends StatefulWidget {
  const FeedbackAluno({Key? key}) : super(key: key);

  @override
  _FeedbackAlunoState createState() => _FeedbackAlunoState();
}

class _FeedbackAlunoState extends State<FeedbackAluno> {
  var relatorios = [];

  @override
  void initState() {
    // Inserção de dados
    Relatorio relatorio1 = new Relatorio();
    relatorio1.nomeAluno = 'Thiago Silva';
    relatorio1.codAluno = '10';
    relatorio1.data = '15/10/2021';
    relatorio1.conteudo =
        'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum';

    Relatorio relatorio2 = new Relatorio();
    relatorio2.nomeAluno = 'Júlia Lima';
    relatorio2.codAluno = '13';
    relatorio2.data = '13/10/2021';
    relatorio2.conteudo =
        'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum';

    relatorios.add(relatorio1);
    relatorios.add(relatorio2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FEEDBACK ALUNO',
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
      body: ListView.builder(
        itemCount: relatorios.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 195,
                      child: Text(
                        'Nome',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    Container(
                      width: 60,
                      child: Text(
                        'Cód',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    Text(
                      'Data',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      width: 180,
                      child: Text(
                        relatorios[index].nomeAluno,
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
                        relatorios[index].codAluno,
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
                      width: 160,
                      child: Text(
                        relatorios[index].data,
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    botaoConsultar(relatorios, index),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  botaoConsultar(relatorios, index) {
    return Container(
      child: IconButton(
        icon: Icon(
          Icons.search,
          size: 32,
        ),
        color: Theme.of(context).primaryColor,
        onPressed: () {
          showDialog(
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
                  relatorios[index].conteudo,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
                actions: [
                  botaoOk(),
                ],
              );
            },
          );
        },
      ),
    );
  }

  botaoOk() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        child: Text(
          'Ok',
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
          Navigator.pop(context);
        },
      ),
    );
  }
}
