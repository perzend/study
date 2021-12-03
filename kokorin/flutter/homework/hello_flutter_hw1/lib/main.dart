// ДЗ по лекции "Ввведение в виджеты"

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    const Center(
      child: Text(
        'Hello Flutter',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Colors.red,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
