import 'package:flutter/material.dart';

buttonLabel(label) {
  return Text(
    label,
    style: TextStyle(
      fontSize: 20,
    ),
  );
}

confirmButtonStyle(context) {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
      Theme.of(context).primaryColor,
    ),
    elevation: MaterialStateProperty.all<double>(0),
    fixedSize: MaterialStateProperty.all<Size>(
      Size(130, 30),
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}

cancelButtonStyle(context) {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
      Theme.of(context).colorScheme.secondary,
    ),
    elevation: MaterialStateProperty.all<double>(0),
    fixedSize: MaterialStateProperty.all<Size>(
      Size(130, 30),
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}

cancelButton(context) {
  return Container(
    padding: EdgeInsets.all(8),
    child: ElevatedButton(
      child: buttonLabel('Cancelar'),
      style: cancelButtonStyle(context),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}
