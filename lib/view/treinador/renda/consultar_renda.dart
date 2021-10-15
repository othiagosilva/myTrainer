import 'package:flutter/material.dart';
import 'package:my_trainer/view/treinador/renda/renda.dart';

class ConsultarRenda extends StatefulWidget {
  const ConsultarRenda({Key? key}) : super(key: key);

  @override
  _ConsultarRendaState createState() => _ConsultarRendaState();
}

class _ConsultarRendaState extends State<ConsultarRenda> {
  var fonteRenda = [];
  var txtNome = TextEditingController();
  var txtValor = TextEditingController();
  var novoValor = TextEditingController();

  @override
  void initState() {
    Renda renda1 = new Renda();
    renda1.nome = 'Aulas';
    renda1.valor = '2200';

    Renda renda2 = new Renda();
    renda2.nome = 'Academia';
    renda2.valor = '1300';

    fonteRenda.add(renda1);
    fonteRenda.add(renda2);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CONSULTAR RENDA',
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
        itemCount: fonteRenda.length,
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
                    Container(
                      width: 80,
                      child: Text(
                        'Valor',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      width: 200,
                      child: Text(
                        fonteRenda[index].nome,
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
                      width: 70,
                      child: Text(
                        fonteRenda[index].valor,
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    botaoAlterar(fonteRenda, index),
                    botaoExcluir(fonteRenda, index),
                  ],
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  backgroundColor: Color.fromRGBO(238, 238, 238, 1),
                  title: Text(
                    'Adicionar Renda',
                    style: (TextStyle(
                      fontSize: 22,
                      color: Theme.of(context).primaryColor,
                    )),
                  ),
                  content: Column(
                    children: [
                      campo(200, 'Nome', txtNome),
                      campo(200, 'Valor', txtValor),
                    ],
                  ),
                  actions: [
                    botaoConfirmar(),
                    botaoCancelar(),
                  ],
                );
              });
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
              fontSize: 28,
              color: Theme.of(context).primaryColor,
            ),
          ),
          TextFormField(
            style: Theme.of(context).textTheme.headline5,
            controller: variavel,
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

  botaoAlterar(fonteRenda, index) {
    return Container(
      child: IconButton(
        icon: Icon(
          Icons.edit,
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
                content: campo(150, 'Insira o novo valor', novoValor),
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
                          fonteRenda[index].valor = novoValor.text;
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Valor alterado com sucesso'),
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

  botaoConfirmar() {
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
          setState(() {
            var msg = '';
            if (txtNome.text.isNotEmpty && txtValor.text.isNotEmpty) {
              Renda renda = new Renda();
              renda.nome = txtNome.text;
              renda.valor = txtValor.text;
              txtNome.clear();
              txtValor.clear();
              fonteRenda.add(renda);
              msg = 'Renda adicionada com sucesso.';
            } else {
              msg = 'Renda não foi adicionada.';
            }
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(msg),
                duration: Duration(seconds: 2),
              ),
            );
            Navigator.pop(context);
          });
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

  botaoExcluir(fonteRenda, index) {
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
                  'Deseja excluir ' + fonteRenda[index].nome + '?',
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
                          fonteRenda.remove(fonteRenda[index]);
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Renda removida com sucesso'),
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
