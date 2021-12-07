// ДЗ по блоку "Основы"

import 'package:flutter/material.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigoAccent,
        appBar: AppBar(
          title: const Text('Counter'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'Tap "-" to decrement',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            CounterWidget(),
            const Text(
              'Tap "+" to increment',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CounterWidgetState();
  }
}

class _CounterWidgetState extends State<CounterWidget> {
  //min -9223372036854775808, max 9223372036854775807
  int _count = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
      // 100 px на кнопки + 10 px на каждый символ
      // если поменять fontSize счетчика - поломается
      //width: 100 + _count.toString().length * 10,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                _count--;
              });
            },
            icon: const Icon(Icons.remove),
          ),
          Expanded(
            child: Text(
              '$_count',
              style: const TextStyle(fontSize: 18),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _count++;
              });
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
