import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.dark,
  backgroundColor: const Color(0xff393b48),
  scaffoldBackgroundColor: const Color(0xff393b48),
  appBarTheme:const AppBarTheme(
    backgroundColor: Color(0xff393b48),
    elevation: 0,
  ),
  colorScheme: const ColorScheme.dark().copyWith(
    primary: Colors.blue,
    background: const Color(0xff393b48),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    focusColor: Colors.blue,
    labelStyle: TextStyle(color: Colors.white),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
  ),
);
