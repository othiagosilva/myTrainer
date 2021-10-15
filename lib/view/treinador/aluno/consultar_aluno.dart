import 'package:flutter/material.dart';
import 'dados_aluno.dart';

class ConsultarAluno extends StatefulWidget {
  const ConsultarAluno({Key? key}) : super(key: key);

  @override
  _ConsultarAlunoState createState() => _ConsultarAlunoState();
}

class _ConsultarAlunoState extends State<ConsultarAluno> {
  var alunos = [];

  @override
  void initState() {
    // Inserção de dados
    Aluno aluno1 = new Aluno();
    aluno1.nome = 'Thiago Silva';
    aluno1.cod = '10';
    aluno1.idade = '19';
    aluno1.peso = '82';
    aluno1.altura = '177';
    Aluno aluno2 = new Aluno();
    aluno2.nome = 'Lorem Ipsum';
    aluno2.cod = '11';
    aluno2.idade = '29';
    aluno2.peso = '82';
    aluno2.altura = '177';

    alunos.add(aluno1);
    alunos.add(aluno2);
    super.initState();
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
      body: ListView.builder(
        itemCount: alunos.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      width: 210,
                      child: Text(
                        alunos[index].nome,
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
                        alunos[index].cod,
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    botaoAlterar(alunos, index),
                    botaoConsultar(alunos, index),
                    botaoExcluir(alunos, index),
                  ],
                )
              ],
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

  botaoAlterar(alunos, index) {
    return Container(
      child: IconButton(
        icon: Icon(
          Icons.edit,
          size: 32,
        ),
        color: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.pushNamed(
            context,
            'alterar_excluir',
            arguments: alunos[index],
          );
        },
      ),
    );
  }

  botaoConsultar(alunos, index) {
    return Container(
      child: IconButton(
        icon: Icon(
          Icons.search,
          size: 32,
        ),
        color: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.pushNamed(
            context,
            'consultar_dados',
            arguments: alunos[index],
          );
        },
      ),
    );
  }

  botaoExcluir(alunos, index) {
    return Container(
      child: IconButton(
        icon: Icon(
          Icons.delete,
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
                  'Deseja excluir ' + alunos[index].nome + '?',
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          alunos.remove(alunos[index]);
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
        },
      ),
    );
  }
}
