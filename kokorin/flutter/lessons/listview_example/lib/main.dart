import 'dart:math';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Building List View',
          ),
          centerTitle: true,
        ),
        body: const BodyListView(),
      ),
    );
  }
}

class BodyListView extends StatelessWidget {
  const BodyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _myListView();
  }
}

// Widget _myListView() {
//   return ListView(
//     padding: EdgeInsets.all(8.0),
//     //scrollDirection: Axis.horizontal,
//     // itemExtent: 200,
//     //  shrinkWrap: true,
//     reverse: true,
//     children: [
//       ListTile(
//         title: Text('Sun'),
//         subtitle: Text('Today clear'),
//         leading: Icon(Icons.wb_sunny),
//         trailing: Icon(Icons.keyboard_arrow_right),
//       ),
//       ListTile(
//         title: Text('Cloudy'),
//         subtitle: Text('Today cloudy'),
//         leading: Icon(Icons.wb_cloudy),
//         trailing: Icon(Icons.keyboard_arrow_right),
//       ),
//       ListTile(
//         title: Text('Snow'),
//         subtitle: Text('Today snow'),
//         leading: Icon(Icons.ac_unit),
//         trailing: Icon(Icons.keyboard_arrow_right),
//       ),
//     ],
//   );
// }

Widget _myListView() {
  final List<ListItem> items = List.generate(
    1000,
    (i) => i % 6 == 0
        ? HeadingItems('Heading $i')
        : MessageItems('Sender $i', 'Message body $i'),
  );
  return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        if (item is HeadingItems) {
          return ListTile(
            title: Text(
              item.heading,
              style: Theme.of(context).textTheme.headline3,
            ),
          );
        } else if (item is MessageItems) {
          return ListTile(
            title: Text(
              item.sender,
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(item.body),
            leading: Icon(Icons.add_a_photo),
            trailing: Icon(Icons.keyboard_arrow_right),
          );
        }
        //throw Exception();
        throw UnimplementedError(); //??? Что правильно возвращать нужно?
        //return Text('');
      });
}

abstract class ListItem {}

class HeadingItems implements ListItem {
  final String heading;
  HeadingItems(this.heading);
}

class MessageItems implements ListItem {
  final String sender;
  final String body;
  MessageItems(this.sender, this.body);
}
