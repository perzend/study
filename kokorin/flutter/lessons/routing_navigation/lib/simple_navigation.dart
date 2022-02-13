import 'package:flutter/material.dart';


// Простая навигация

class SimpleNavigation extends StatelessWidget {
  const SimpleNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Routing and Navigation'), centerTitle: true,),
        body: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            Route route = MaterialPageRoute(builder: ((context) => const Page2()));
            Navigator.push(context, route);
          },
          child: const Text('Go to Page2')),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page2'),centerTitle: true,),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go Home Page')),
      ),
    );
  }
}
