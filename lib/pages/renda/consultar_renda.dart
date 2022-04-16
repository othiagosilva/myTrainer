import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/components/my_buttons.dart';
import 'package:my_trainer/components/show_dialog.dart';
import 'package:my_trainer/components/show_message.dart';
import 'package:my_trainer/components/text_field.dart';
import 'package:my_trainer/components/logout.dart';

class ConsultarRenda extends StatefulWidget {
  const ConsultarRenda({Key? key}) : super(key: key);

  @override
  _ConsultarRendaState createState() => _ConsultarRendaState();
}

class _ConsultarRendaState extends State<ConsultarRenda> {
  late CollectionReference finance;

  @override
  void initState() {
    super.initState();

    finance = FirebaseFirestore.instance.collection('renda');
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
        stream: finance.snapshots(),
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
              final data = snapshot.requireData;
              return ListView.builder(
                itemCount: data.size,
                itemBuilder: (context, index) {
                  return exibirItemColecao(data.docs[index]);
                },
              );
          }
        },
      ),
      floatingActionButton: addFinanceButton(),
    );
  }

  getDocumentById(id) async {
    await finance.doc(id).get().then((doc) {
      _txtName.text = doc.get('nome');
      _txtValue.text = doc.get('valor');
    });
  }

  addFinanceButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        await myShowDialog(addFinancePopUpContent(), context);
      },
    );
  }

  addFinancePopUpContent() {
    return Container(
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
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              confirmFinanceButton(),
              cancelButton(context),
            ]),
          ],
        ),
      ),
    );
  }

  confirmFinanceButton() {
    return ElevatedButton(
      child: buttonLabel('Confirmar'),
      style: confirmButtonStyle(context),
      onPressed: () {
        if (_txtName.text.isNotEmpty && _txtValue.text.isNotEmpty) {
          FirebaseFirestore.instance.collection('renda').add({
            'nome': _txtName.text,
            'valor': _txtValue.text,
          });
          showMessage('Adicionada com sucesso', context);
          Navigator.pop(context);
          FocusScope.of(context).unfocus();
          _txtName.text = '';
          _txtValue.text = '';
        }
      },
    );
  }

  exibirItemColecao(data) {
    var id = ModalRoute.of(context)?.settings.arguments;

    if (id != null) {
      if (_txtName.text.isEmpty && _txtValue.text.isEmpty) {
        getDocumentById(id);
      }
    }

    String name = data.data()['nome'];
    String value = data.data()['valor'];

    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child:
                    Text('Nome', style: Theme.of(context).textTheme.headline3),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                padding: EdgeInsets.all(5),
                width: 150,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(name,
                        style: Theme.of(context).textTheme.headline5)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child:
                    Text('Valor', style: Theme.of(context).textTheme.headline3),
              ),
              Container(
                width: 80,
                padding: EdgeInsets.all(5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child:
                      Text(value, style: Theme.of(context).textTheme.headline5),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ],
          ),
          Column(children: [
            alterButton(data, id),
          ]),
          Column(children: [
            removeButton(data, name),
          ]),
        ],
      ),
    );
  }

  alterButton(data, id) {
    return IconButton(
      icon: Icon(
        Icons.edit,
        size: 32,
      ),
      color: Theme.of(context).primaryColor,
      onPressed: () {
        myShowDialog(alterPopUpContent(data, id), context);
      },
    );
  }

  alterPopUpContent(data, id) {
    return Container(
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
              confirmAlterButton(data, id),
              cancelButton(context),
            ],
          ),
        ],
      ),
    );
  }

  confirmAlterButton(data, id) {
    return ElevatedButton(
      child: buttonLabel('Confirmar'),
      style: confirmButtonStyle(context),
      onPressed: () {
        finance.doc(data.id).delete();
        Navigator.pop(context);
        finance.doc(id.toString()).set({
          'nome': _txtName.text,
          'valor': _txtValue.text,
        });
      },
    );
  }

  removeButton(dados, incomeName) {
    return IconButton(
      icon: Icon(
        Icons.delete,
        size: 32,
      ),
      color: Theme.of(context).primaryColor,
      onPressed: () {
        removeConfirmationPopUp(dados, incomeName);
      },
    );
  }

  removeConfirmationPopUp(data, incomeName) {
    return myShowDialog(
        removeConfirmationPopUpContent(data, incomeName), context);
  }

  removeConfirmationPopUpContent(data, incomeName) {
    return Container(
      height: 150,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 32),
            child: Text(
              'Deseja excluir ' + incomeName + '?',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              confirmDeletionButton(data),
              cancelButton(context),
            ],
          )
        ],
      ),
    );
  }

  confirmDeletionButton(dados) {
    return ElevatedButton(
      child: buttonLabel('Confirmar'),
      style: confirmButtonStyle(context),
      onPressed: () {
        setState(() {
          finance.doc(dados.id).delete();
          Navigator.pop(context);
          showMessage('Renda removida com sucesso', context);
        });
      },
    );
  }
}
