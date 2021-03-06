import 'package:final_project/module/users/user_details_view.dart';
import 'package:final_project/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
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
      appBar: AppBar(
        title: const Text('List of users'),
        centerTitle: true,
      ),
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

  // String _createAvatarName(int userID, String userName) {
  //
  //   String avatarName;
  //  avatarName = userID.toString() + userName.
  //
  //
  //   return avatarName;
  // }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                'https://randomuser.me/api/portraits/men/${users[index].id}.jpg'),
            backgroundColor: Colors.red,
          ),
          //const Icon(Icons.account_circle, size: 60,),
          title: Text(
            '${users[index].id}. ${users[index].name}',
            style: Theme.of(context).textTheme.headline6,
          ),
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
