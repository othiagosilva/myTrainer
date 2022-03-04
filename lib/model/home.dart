import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/pages/home/home_aluno.dart';
import 'package:my_trainer/pages/home/home_treinador.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late CollectionReference users;

  @override
  void initState() {
    super.initState();
    users = FirebaseFirestore.instance.collection('usuarios');
  }

  @override
  Widget build(BuildContext context) {
    return tipoHome();
  }

  tipoHome() {
    FirebaseAuth.instance.currentUser?.uid;

    return StreamBuilder<QuerySnapshot>(
        stream: users.snapshots(),
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
              User? user = FirebaseAuth.instance.currentUser;

              for (int index = 0; index < data.size; index++) {
                if (permission(data.docs[index], user)) {
                  return HomeTreinador();
                }
              }
              return HomeAluno();
          }
        });
  }

  bool permission(data, user) {
    String _user = data.data()['usuario'];
    String _permission = data.data()['permissao'];

    if (user.displayName == _user) {
      if (_permission == 't') {
        return true;
      }
    }

    return false;
  }
}
