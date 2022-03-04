import 'package:flutter/material.dart';

showMessage(msg, context) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        style: Theme.of(context).textTheme.headline3,
      ),
      duration: Duration(seconds: 2),
    ),
  );
}
