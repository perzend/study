import 'package:flutter/material.dart';

ThemeData globalTheme() => ThemeData(
      fontFamily: 'Raleway',
      splashColor: Colors.pink,
      scaffoldBackgroundColor: const Color(0xFF5DB075),
      toggleableActiveColor: Colors.red,
      backgroundColor: const Color(0xFFECEFF1),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        primarySwatch: Colors.amber,
      ).copyWith(
        secondary: Colors.yellowAccent,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontFamily: 'Raleway', fontSize: 36.0, fontStyle: FontStyle.italic, color: Colors.brown),
        headline6: TextStyle(
            fontFamily: 'RobotoMono',
            fontSize: 20.0,
            fontWeight: FontWeight.bold, color: Colors.black54),
        bodyText2: TextStyle(fontFamily: 'RobotoMono', fontSize: 16.0, color: Colors.deepPurple, fontStyle: FontStyle.italic),
      ),
    );
