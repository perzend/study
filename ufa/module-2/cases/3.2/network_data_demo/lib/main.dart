import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


// Функция загрузки и конвертации данных в объект
Future<Post> fetchPost() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Post.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load post');
  }
}

// Класс, повторяющий структуру ответа сервера
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  // Конструктор класса
  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  // Метод конвертации из JSON
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Post> _futurePost;
  bool _isExpanded = false;

  final Icon _iconBody = const Icon(
    Icons.arrow_drop_down,
    size: 25.0,
    color: Colors.blueGrey,
  );

  Color _expandedColor() {
    return _isExpanded ? Colors.grey : Colors.blueGrey;
  }

  @override
  void initState() {
    super.initState();
    //Загрузка данных
    _futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue.shade100,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: FutureBuilder<Post>(
          future: _futurePost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                margin: const EdgeInsets.only(left: 12.0, top: 6.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    bottomLeft: Radius.circular(32),
                  ),
                ),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    leading: Column(
                      children: [
                        Icon(
                          Icons.title,
                          size: 40.0,
                          color: _expandedColor(),
                        ),
                        Text(
                          'TITLE',
                          style: TextStyle(
                              color: _expandedColor(),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    onExpansionChanged: (value) {
                      setState(() {
                        _isExpanded = value;
                      });
                    },
                    title: Text(
                      snapshot.data!.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: _expandedColor(), fontSize: 18.0),
                    ),
                    children: [
                      Divider(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        thickness: 5.0,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _iconBody,
                              const Text(
                                'BODY',
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              _iconBody,
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, bottom: 12.0),
                            child: Text(
                              snapshot.data!.body,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
