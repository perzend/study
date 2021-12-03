import 'dart:ui';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'ComforterBrush'),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Assets Flutter'),
          centerTitle: true,
        ),
        body: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              const Image(
                image: AssetImage('assets/images/bg.jpg'),
              ),
              Image.asset('assets/icons/icon.png'),
              const Positioned(
                  top: 16,
                  left: 100,
                  child: Text(
                    'My Custom Font',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      //fontFamily: 'ComforterBrush',
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
