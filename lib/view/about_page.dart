import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          'SOBRE',
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(12),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(71, 9, 9, 1),
                        blurRadius: 0,
                      ),
                    ],
                    border: Border.all(width: 2.0, color: Colors.white),
                  ),
                  child: Icon(
                    Icons.fitness_center,
                    color: Theme.of(context).primaryColor,
                    size: 90,
                  ),
                ),
                Text(
                  'myTrainer',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 24),
            padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Text(
              'O myTrainer é um aplicativo com foco em auxiliar o profissional de educação física no gerenciamento de seus alunos, treinos e finanças.',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(1000.0),
            child: Image.asset(
              'lib/images/tas.jpg',
              width: 200,
              height: 200,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: Text(
              'Desenvolvido por: Thiago Alves Silva',
              style: Theme.of(context).textTheme.headline3,
            ),
          )
        ],
      ),
    );
  }
}
