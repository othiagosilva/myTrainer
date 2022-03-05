import 'package:flutter/material.dart';

cancelButton(context) {
  return Container(
    padding: EdgeInsets.all(8),
    child: ElevatedButton(
      child: Text(
        'Cancelar',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.secondary,
        ),
        elevation: MaterialStateProperty.all<double>(0),
        fixedSize: MaterialStateProperty.all<Size>(
          Size(120, 30),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}
