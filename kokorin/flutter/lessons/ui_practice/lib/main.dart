import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Building layouts'),
          centerTitle: true,
        ),
        //   body: Container(
        //     decoration: BoxDecoration(
        //       color: Colors.amber,
        //       border: Border.all(),
        //     ),
        //     width: 220,
        //     height: 100,
        //     padding: EdgeInsets.all(16.0),
        //     margin: EdgeInsets.all(30.0),
        //     alignment: Alignment.center,
        //     child: Text(
        //       'Hello, Flutter!',
        //       style: TextStyle(
        //         fontSize: 30,
        //       ),
        //     ),
        //   ),
        // ),

        //   body: Container(
        //     decoration: BoxDecoration(
        //       color: Colors.indigo,
        //     ),
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       crossAxisAlignment: CrossAxisAlignment.stretch,
        //       children: [
        //         Icon(
        //           Icons.adjust,
        //           size: 50,
        //           color: Colors.red,
        //         ),
        //         Icon(
        //           Icons.adjust,
        //           size: 200,
        //           color: Colors.green,
        //         ),
        //         Icon(
        //           Icons.adjust,
        //           size: 50,
        //           color: Colors.blue,
        //         ),
        //       ],
        //     ),
        //   ),
        // ),

        // body: Container(
        //   decoration: BoxDecoration(
        //     color: Colors.indigo,
        //   ),
        //   child: Row(
        //     children: [
        //       Expanded(
        //         flex: 4,
        //         child: Image.network(
        //             'https://images.pexels.com/photos/2876511/pexels-photo-2876511.jpeg'),
        //       ),
        //       Expanded(
        //         flex: 3,
        //         child: Container(
        //           color: Colors.red,
        //           padding: EdgeInsets.all(30.0),
        //           child: Text('1'),
        //         ),
        //       ),
        //       Expanded(
        //         flex: 2,
        //         child: Container(
        //           color: Colors.green,
        //           padding: EdgeInsets.all(30.0),
        //           child: Text('2'),
        //         ),
        //       ),
        //       Expanded(
        //         child: Container(
        //           color: Colors.blue,
        //           padding: EdgeInsets.all(30.0),
        //           child: Text('3'),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.tv,
              size: 200,
              color: Colors.red,
            ),
            Positioned(
              top: 50,
              left: 30,
              child: Text(
                'TV',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
