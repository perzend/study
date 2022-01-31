import 'package:final_project/models/todos_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../services/networking.dart';

class UserToDosList extends StatelessWidget {
  const UserToDosList({Key? key, required this.userId}) : super(key: key);

  final int userId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ToDos>>(
      future: fetchToDos(http.Client(), userId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('An error has occurred!'),
          );
        } else if (snapshot.hasData) {
          return ToDosList(toDoS: snapshot.data!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class ToDosList extends StatelessWidget {
  const ToDosList({Key? key, required this.toDoS}) : super(key: key);

  final List<ToDos> toDoS;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: toDoS.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            value: toDoS[index].completed,
            onChanged: (val) {},
            title: Text('${index+1}. ${toDoS[index].title}'),
          );
        },
      ),
    );
  }
}
