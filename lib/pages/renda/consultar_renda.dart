//! ANALISAR VIABILIDADE DE CONSTRUIR FUNÇÃO DINÂMICA DE "showDialog",
//! FUNÇÕES PRÓPRIAS QUE A UTILIZAM:
//! mensagemConfirmacao,
//! botaoAlterar,
//! botaoAdicionarRenda.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/components/my_buttons.dart';
import 'package:my_trainer/components/text_field.dart';
import 'package:my_trainer/components/logout.dart';

class ConsultarRenda extends StatefulWidget {
  const ConsultarRenda({Key? key}) : super(key: key);

  @override
  _ConsultarRendaState createState() => _ConsultarRendaState();
}

class _ConsultarRendaState extends State<ConsultarRenda> {
  late CollectionReference renda;

  @override
  void initState() {
    super.initState();

    renda = FirebaseFirestore.instance.collection('renda');
  }

  var _txtName = TextEditingController();
  var _txtValue = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
          WidgetLogout(),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: StreamBuilder<QuerySnapshot>(
        stream: renda.snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(
                child: Text('Não foi possível conectar ao Firestore'),
              );
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              final dados = snapshot.requireData;
              return ListView.builder(
                  itemCount: dados.size,
                  itemBuilder: (context, index) {
                    return exibirItemColecao(dados.docs[index]);
                  });
          }
        },
      ),
      floatingActionButton: botaoAdicionarRenda(),
    );
  }

  getDocumentById(id) async {
    await renda.doc(id).get().then((doc) {
      _txtName.text = doc.get('nome');
      _txtValue.text = doc.get('valor');
    });
  }

  botaoAdicionarRenda() {
    return FloatingActionButton(
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
                backgroundColor: Theme.of(context).backgroundColor,
                title: Text(
                  'Adicionar Renda',
                  style: (TextStyle(
                    fontSize: 30,
                  )),
                ),
                content: Container(
                  height: 220,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                          child: Column(
                            children: [
                              WidgetTextField('Nome', _txtName),
                              WidgetTextField('Valor', _txtValue),
                            ],
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              botaoConfirmarAdicao(),
                              cancelButton(context),
                            ]),
                      ],
                    ),
                  ),
                ),
              );
            });
      },
    );
  }

  botaoConfirmarAdicao() {
    return ElevatedButton(
      child: Text(
        'Confirmar',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).primaryColor,
        ),
        elevation: MaterialStateProperty.all<double>(0),
        fixedSize: MaterialStateProperty.all<Size>(
          Size(123, 30),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      onPressed: () {
        if (_txtName.text.isNotEmpty && _txtValue.text.isNotEmpty) {
          FirebaseFirestore.instance.collection('renda').add({
            'nome': _txtName.text,
            'valor': _txtValue.text,
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Adicionada com sucesso'),
              duration: Duration(seconds: 2),
            ),
          );
          Navigator.pop(context);
          FocusScope.of(context).unfocus();
          _txtName.text = '';
          _txtValue.text = '';
        }
      },
    );
  }

  exibirItemColecao(dados) {
    var id = ModalRoute.of(context)?.settings.arguments;

    if (id != null) {
      if (_txtName.text.isEmpty && _txtValue.text.isEmpty) {
        getDocumentById(id);
      }
    }

    String nome = dados.data()['nome'];
    String valor = dados.data()['valor'];
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                padding: EdgeInsets.all(5),
                width: 180,
                child: Text(nome, style: Theme.of(context).textTheme.headline5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Text("R\$ $valor",
                    style: Theme.of(context).textTheme.headline5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              botaoAlterar(dados, id),
              botaoExcluir(dados, nome),
            ],
          )
        ],
      ),
    );
  }

  botaoAlterar(dados, id) {
    return IconButton(
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
              backgroundColor: Theme.of(context).backgroundColor,
              content: Container(
                height: 220,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: Column(
                        children: [
                          WidgetTextField('Nome', _txtName),
                          WidgetTextField('Valor', _txtValue),
                        ],
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          botaoConfirmarAlteracao(dados, id),
                          cancelButton(context),
                        ]),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  botaoConfirmarAlteracao(dados, id) {
    return ElevatedButton(
      child: Text(
        'Confirmar',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).primaryColor,
        ),
        elevation: MaterialStateProperty.all<double>(0),
        fixedSize: MaterialStateProperty.all<Size>(
          Size(123, 30),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      onPressed: () {
        renda.doc(dados.id).delete();
        Navigator.pop(context);
        renda.doc(id.toString()).set({
          'nome': _txtName.text,
          'valor': _txtValue.text,
        });
      },
    );
  }

  botaoExcluir(dados, nomeRenda) {
    return IconButton(
        icon: Icon(
          Icons.delete,
          size: 32,
        ),
        color: Theme.of(context).primaryColor,
        onPressed: () {
          mensagemConfirmacao(dados, nomeRenda);
        });
  }

  mensagemConfirmacao(dados, nomeRenda) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          content: Container(
            height: 150,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 32),
                  child: Text(
                    'Deseja excluir ' + nomeRenda + '?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    botaoConfirmarExclusao(dados),
                    cancelButton(context),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  botaoConfirmarExclusao(dados) {
    return ElevatedButton(
      child: Text(
        'Confirmar',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).primaryColor,
        ),
        elevation: MaterialStateProperty.all<double>(0),
        fixedSize: MaterialStateProperty.all<Size>(
          Size(123, 30),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      onPressed: () {
        setState(() {
          renda.doc(dados.id).delete();
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Renda removida com sucesso'),
            duration: Duration(seconds: 2),
          ));
        });
      },
    );
  }
}
