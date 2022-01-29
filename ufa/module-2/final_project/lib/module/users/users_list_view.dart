import 'package:final_project/module/users/user_details_view.dart';
import 'package:final_project/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/users_model.dart';
import '../../services/networking.dart';

class UsersListPage extends StatelessWidget {
  const UsersListPage({Key? key}) : super(key: key);

  static const String routeName = '/usersList';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(),
      body: FutureBuilder<List<Users>>(
        future: fetchUsers(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return UsersList(users: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class UsersList extends StatelessWidget {
  const UsersList({Key? key, required this.users}) : super(key: key);

  final List<Users> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('${users[index].id}. ${users[index].name}'),
          subtitle: Text(users[index].email),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UserDetails(user: users[index])),
            );
          },
        );
      },
    );
  }
}
