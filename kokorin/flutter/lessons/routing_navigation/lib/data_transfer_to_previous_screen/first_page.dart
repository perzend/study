import 'package:flutter/material.dart';
import 'package:routing_navigation/data_transfer_to_previous_screen/second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String text = 'Some text';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            ElevatedButton(
              onPressed: () {
                _returnDataFromSecondPage(context);
              },
              child: const Text('Go to Second Screen'),
            ),
          ],
        ),
      ),
    );
  }

  void _returnDataFromSecondPage(BuildContext context) async {
    Route route = MaterialPageRoute(
      builder: (context) => const SecondPage(),
    );
    final result = await Navigator.push(context, route) ?? 'null';
    setState(() {
      text = result;
    });
  }
}
