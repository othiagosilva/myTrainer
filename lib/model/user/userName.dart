import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetUsername extends StatefulWidget {
  const GetUsername({Key? key}) : super(key: key);

  @override
  _GetUsernameState createState() => _GetUsernameState();
}

class _GetUsernameState extends State<GetUsername> {
  late CollectionReference user;

  @override
  void initState() {
    super.initState();
    user = FirebaseFirestore.instance.collection('usuarios');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 14, 0, 0),
      child: getUsername(),
    );
  }

  getUsername() {
    return StreamBuilder<QuerySnapshot>(
        stream: user.snapshots(),
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
                updateFirebaseUsername(data.docs[index], user);
              }

              for (int index = 0; index < data.size; index++) {
                if (checkUser(data.docs[index], user)) {
                  return getUser(user?.displayName, data.docs[index]);
                }
              }
              return Text('como chegou aqui?');
          }
        });
  }

  updateFirebaseUsername(data, user) {
    String _email = data.data()['email'];
    String _user = data.data()['usuario'];

    if (_email == user?.email) {
      user?.updateDisplayName(_user);
    }
  }

  bool checkUser(data, user) {
    String _user = data.data()['usuario'];

    if (_user == user?.displayName) {
      return true;
    }

    return false;
  }

  getUser(user, data) {
    String _permission = data.data()['permissao'];
    String _userPermission = 'treinador';

    if (_permission == 'a') {
      _userPermission = 'aluno';
    }

    return Column(
      children: [
        Text(
          user.toString(),
          style: TextStyle(fontSize: 16),
        ),
        Text(
          _userPermission,
          style: TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.italic,
            color: Theme.of(context).primaryColor,
          ),
        )
      ],
    );
  }
}
