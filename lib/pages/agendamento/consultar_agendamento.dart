import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/components/logout.dart';
import 'package:my_trainer/components/my_buttons.dart';
import 'package:my_trainer/components/show_dialog.dart';
import 'package:my_trainer/components/show_message.dart';
import 'package:my_trainer/components/text_field.dart';

class ConsultarAgendamento extends StatefulWidget {
  const ConsultarAgendamento({Key? key}) : super(key: key);

  @override
  _ConsultarAgendamentoState createState() => _ConsultarAgendamentoState();
}

class _ConsultarAgendamentoState extends State<ConsultarAgendamento> {
  late CollectionReference aula;
  var _txtAthleteID = TextEditingController();
  var _txtDate = TextEditingController();

  @override
  void initState() {
    super.initState();

    aula = FirebaseFirestore.instance.collection('aula');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CONSULTAR HORÁRIO',
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
        stream: aula.snapshots(),
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
    );
  }

  getDocumentById(id) async {
    await aula.doc(id).get().then((doc) {
      _txtAthleteID.text = doc.get('codAluno');
      _txtDate.text = doc.get('dia');
    });
  }

  exibirItemColecao(data) {
    var id = ModalRoute.of(context)?.settings.arguments;

    if (id != null) {
      if (_txtAthleteID.text.isEmpty && _txtDate.text.isEmpty) {
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
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 100, 0),
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
                WidgetTextField('Código Aluno', _txtAthleteID),
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
        aula.doc(data.id).delete();
        Navigator.pop(context);
        aula.doc(id.toString()).set({
          'codAluno': _txtAthleteID.text,
          'data': _txtDate.text,
        });
      },
    );
  }

  removeButton(dados, nomeRenda) {
    return IconButton(
      icon: Icon(
        Icons.delete,
        size: 32,
      ),
      color: Theme.of(context).primaryColor,
      onPressed: () {
        removeConfirmationPopUp(dados, nomeRenda);
      },
    );
  }

  removeConfirmationPopUp(data, incomeName) {
    return myShowDialog(
        removeConfirmationPopUpContent(data, incomeName), context);
  }

  removeConfirmationPopUpContent(data, incomeName) {
    return Container(
      height: 180,
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
          aula.doc(dados.id).delete();
          Navigator.pop(context);
          showMessage('Aula cancelada com sucesso', context);
        });
      },
    );
  }
}
