import 'package:flutter/material.dart';

class DataTransferNamedNavigation extends StatelessWidget {
  const DataTransferNamedNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const FirstScreen(),
      routes: {
        '/first': (context) => const FirstScreen(),
        '/second': (context) => SecondScreen(),
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('First Screen'),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              User user = User(name: 'Alexey', age: 38);
              Navigator.pushNamed(context, '/second', arguments: user);
            },
            child: const Text('Go to Second Screen'),
          ),
        ));
  }
}

class SecondScreen extends StatelessWidget {
 User? user;
  SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RouteSettings? settings = ModalRoute.of(context)?.settings;
    user = settings?.arguments as User;
    return Scaffold(
        appBar: AppBar(
          title: Text('${user!.name} - ${user!.age}'),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go to First Screen'),
          ),
        ));
  }
}

class User {
  final String? name;
  final int? age;

  User({this.name, this.age});
}
