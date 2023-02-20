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
    primary: const Color(0xff393b48),
    background: const Color(0xff393b48),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    focusColor: Color.fromARGB(255, 214, 255, 167),
    labelStyle: TextStyle(color: Colors.white),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 214, 255, 167)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 214, 255, 167)),
    ),
  ),
);
