import 'package:flutter/material.dart';

class DataTransferOnGenerateRoute extends StatelessWidget {
  const DataTransferOnGenerateRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const FirstScreen(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                  builder: (context) => const FirstScreen());
            case '/second':
              User user = settings.arguments as User;
              return MaterialPageRoute(
                  builder: (context) => SecondScreen(
                        user: user,
                      ));
          }
        });
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
              User user = User(name: 'Alexey', age: 39);
              Navigator.pushNamed(context, '/second', arguments: user);
            },
            child: const Text('Go to Second Screen'),
          ),
        ));
  }
}

class SecondScreen extends StatelessWidget {
  final User? user;
  const SecondScreen({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
