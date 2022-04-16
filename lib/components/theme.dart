import 'package:flutter/material.dart';

final ThemeData theme = ThemeData();
final myTrainerTheme = theme.copyWith(
  primaryColor: Color.fromRGBO(198, 26, 26, 1),
  backgroundColor: Color.fromRGBO(17, 17, 17, 1),
  colorScheme:
      theme.colorScheme.copyWith(secondary: Color.fromRGBO(71, 9, 9, 1)),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 24,
      color: Colors.white,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      fontSize: 24,
      color: Color.fromRGBO(198, 26, 26, 1),
      fontWeight: FontWeight.bold,
    ),
    headline3: TextStyle(
      fontSize: 24,
      color: Colors.white,
    ),
    headline4: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline5: TextStyle(
      fontSize: 22,
      color: Colors.black,
    ),
    headline6: TextStyle(
      fontSize: 24,
      color: Colors.white,
    ),
  ),
);
