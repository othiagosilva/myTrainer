import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/widgets/widget_Logout.dart';

class ConsultarRenda extends StatefulWidget {
  const ConsultarRenda({Key? key}) : super(key: key);

  @override
  _ConsultarRendaState createState() => _ConsultarRendaState();
}

class _ConsultarRendaState extends State<ConsultarRenda> {
  var txtNome = TextEditingController();
  var txtValor = TextEditingController();

  //*
  //* Firebase connection
  //*
  late CollectionReference renda;

  @override
  void initState() {
    super.initState();

    renda = FirebaseFirestore.instance.collection('renda');
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
  //* Get a document by ID
  //*
  getDocumentById(id) async {
    await renda.doc(id).get().then((doc) {
      txtNome.text = doc.get('nome');
      txtValor.text = doc.get('valor');
    });
  }

  //*
  //* Items list
  //*
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
                width: 100,
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
      ),
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
                    campoTxt('Nome', txtNome),
                    campoTxt('Valor', txtValor),
                  ],
                ),
                actions: [
                  botaoConfirmar(),
                  botaoCancelar(),
                ],
              );
            });
      },
    );
  }

  campoTxt(rotulo, variavel) {
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
                backgroundColor: Color.fromRGBO(238, 238, 238, 1),
                content: Column(
                  children: [
                    campoTxt('Nome', txtNome),
                    campoTxt('Valor', txtValor),
                  ],
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
          backgroundColor: Color.fromRGBO(238, 238, 238, 1),
          content: Text(
            'Deseja excluir ' + nomeRenda + '?',
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
}
