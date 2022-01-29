import 'package:final_project/module/users/user_todos_list.dart';
import 'package:flutter/material.dart';
import 'package:final_project/models/users_model.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({Key? key, required this.user}) : super(key: key);

  final Users user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('${user.id}. ${user.name}'),
            subtitle: Text(user.email),
          ),
          ExpansionTile(title: Text('Address'), children: [
            Text(user.address.street),
            Text(user.address.suite),
            Text(user.address.city),
            Text(user.address.zipcode),
            ExpansionTile(title: Text('Geoposition'), children: [
              Text(user.address.geo.lat),
              Text(user.address.geo.lng),

            ],)

          ],),
          Text(user.phone),
          Text(user.website),
          ExpansionTile(title: Text('Company'), children: [
            Text(user.company.name),
            Text(user.company.catchPhrase),
            Text(user.company.bs),
          ],),
          UserToDosList(userId: user.id),
        ],
      ),
    );
  }
}
