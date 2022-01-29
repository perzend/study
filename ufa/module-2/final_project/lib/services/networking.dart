import 'dart:async';
import 'dart:convert';

import 'package:final_project/models/todos_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/users_model.dart';


Future<List<Users>> fetchUsers(http.Client client) async {
  final response =
  await client.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  // Use the compute function to run parseUsers in a separate isolate.
  return compute(parseUsers, response.body);
}

// A function that converts a response body into a List<User>.
List<Users> parseUsers(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Users>((json) => Users.fromJson(json)).toList();
}

Future<List<ToDos>> fetchToDos(http.Client client, int userId) async {
  final response =
  await client.get(Uri.parse('https://jsonplaceholder.typicode.com/todos?userId=$userId'));

  // Use the compute function to run parseTodos in a separate isolate.
  return compute(parseToDos, response.body);
}

// A function that converts a response body into a List<ToDos>.
List<ToDos> parseToDos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<ToDos>((json) => ToDos.fromJson(json)).toList();
}