//! ANALISAR VIABILIDADE DE CONSTRUIR FUNÇÃO DINÂMICA DE "showDialog",
//! FUNÇÕES PRÓPRIAS QUE A UTILIZAM:
//! mensagemConfirmacao,
//! botaoAlterar,
//! botaoAdicionarRenda.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/widgets/widget_CampoTexto.dart';
import 'package:my_trainer/widgets/widget_logout.dart';

class ConsultarRenda extends StatefulWidget {
  const ConsultarRenda({Key? key}) : super(key: key);

  @override
  _ConsultarRendaState createState() => _ConsultarRendaState();
}

class _ConsultarRendaState extends State<ConsultarRenda> {
  //*
  //* Firebase connection to collection
  //*
  late CollectionReference renda;

  @override
  void initState() {
    super.initState();

    renda = FirebaseFirestore.instance.collection('renda');
  }

  var txtNome = TextEditingController();
  var txtValor = TextEditingController();
  final formKey = GlobalKey<FormState>();
  //*
  //* View
  //*
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

  //*
  //* Model
  //*
  getDocumentById(id) async {
    await renda.doc(id).get().then((doc) {
      txtNome.text = doc.get('nome');
      txtValor.text = doc.get('valor');
    });
  }

  //*
  //* Functions
  //*
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
          content: Text(
            'Deseja excluir ' + nomeRenda + '?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
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
                    Size(140, 50),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
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
              ),
            ),
            botaoCancelar(),
          ],
        );
      },
    );
  }

  exibirItemColecao(dados) {
    //*
    //* Get item ID selected by the user.
    //*
    var id = ModalRoute.of(context)?.settings.arguments;

    if (id != null) {
      if (txtNome.text.isEmpty && txtValor.text.isEmpty) {
        getDocumentById(id);
      }
    }

    //*
    //* Get data
    //*
    String nome = dados.data()['nome'];
    String valor = dados.data()['valor'];
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 200,
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
              width: 190,
              child: Text(
                nome,
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
              width: 80,
              child: Text(
                valor,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
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
    );
  }

  botaoAlterar(dados, id) {
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
                backgroundColor: Theme.of(context).backgroundColor,
                content: Container(
                  width: 400,
                  height: 266,
                  child: Column(
                    children: [
                      WidgetCampoTexto('Nome', txtNome),
                      WidgetCampoTexto('Valor', txtValor),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
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
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Theme.of(context).primaryColor,
                                  ),
                                  elevation:
                                      MaterialStateProperty.all<double>(0),
                                  fixedSize: MaterialStateProperty.all<Size>(
                                    Size(140, 50),
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  renda.doc(dados.id).delete();
                                  Navigator.pop(context);
                                  renda.doc(id.toString()).set({
                                    'nome': txtNome.text,
                                    'valor': txtValor.text,
                                  });
                                },
                              ),
                            ),
                            botaoCancelar(),
                          ]),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  botaoExcluir(dados, nomeRenda) {
    return Container(
      child: IconButton(
          icon: Icon(
            Icons.delete,
            size: 32,
          ),
          color: Theme.of(context).primaryColor,
          onPressed: () {
            mensagemConfirmacao(dados, nomeRenda);
          }),
    );
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
                    fontSize: 36,
                  )),
                ),
                content: Container(
                  height: 266,
                  width: 400,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        WidgetCampoTexto('Nome', txtNome),
                        WidgetCampoTexto('Valor', txtValor),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              botaoConfirmar(),
                              botaoCancelar(),
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
            Size(140, 50),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        onPressed: () {
          if (txtNome.text.isNotEmpty && txtValor.text.isNotEmpty) {
            FirebaseFirestore.instance.collection('renda').add({
              'nome': txtNome.text,
              'valor': txtValor.text,
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Adicionada com sucesso'),
                duration: Duration(seconds: 2),
              ),
            );
            Navigator.pop(context);
            FocusScope.of(context).unfocus();
            txtNome.text = '';
            txtValor.text = '';
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
            Size(140, 50),
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
