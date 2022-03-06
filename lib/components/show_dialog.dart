import 'package:flutter/material.dart';

myShowDialog(content, context) {
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
        content: content,
      );
    },
  );
}
