import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyListItem extends StatelessWidget {
  const MyListItem(
      {Key? key,
      required this.name,
      required this.phone,
      required this.selected})
      : super(key: key);

  final String name;
  final String phone;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: selected ? Colors.greenAccent : Colors.yellowAccent,
        shape: BoxShape.rectangle,
        border:
            Border.all(color: Colors.red, width: 2.0, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
              child: Icon(
                Icons.account_circle,
                color: Colors.deepPurple,
                size: 36.0,
              ),
            ),
            Text(
              name,
              style: Theme.of(context).textTheme.headline5,
            ),
          ]),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 8.0),
                child: Icon(
                  Icons.phone,
                  color: Colors.deepPurple,
                  size: 36.0,
                ),
              ),
              Text(
                phone,
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: _users.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: MyListItem(
                    name: _users.elementAt(index).name,
                    phone: _users.elementAt(index).phone,
                    selected: _selectedIndex == index),
              );
            }),
      ),
    );
  }
}

class User {
  String name;
  String phone;

  User({required this.name, required this.phone});
}

List<User> _users = [
  User(name: 'Иванов Петр', phone: '+79261234567'),
  User(name: 'Сидоров Иван', phone: '+792674939048'),
  User(name: 'Петров Сидор', phone: '+79269475039'),
  User(name: 'Кузнецов Максим', phone: '+79260735375'),
  User(name: 'Максимов Юрий', phone: '+792607563527'),
  User(name: 'Юрьев Павел', phone: '+79263283263'),
  User(name: 'Павлов Петр', phone: '+792602947563'),
  User(name: 'Качалов Андрей', phone: '+792603837464'),
  User(name: 'Андреев Евгений', phone: '+79260375674'),
  User(name: 'Евгеньев Виктор', phone: '+79268374658'),
  User(name: 'Викторов Александр', phone: '+79269384756'),
  User(name: 'Александров Илья', phone: '+79269384756'),
];
