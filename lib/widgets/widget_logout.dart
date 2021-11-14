import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WidgetLogout extends StatelessWidget {
  const WidgetLogout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
      child: IconButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
          Navigator.pushNamed(context, 'login');
        },
        icon: Icon(
          Icons.logout,
          size: 32,
        ),
      ),
    );
  }
}
