import 'package:final_project/module/users/user_todos_list.dart';
import 'package:flutter/material.dart';
import 'package:final_project/models/users_model.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({Key? key, required this.user}) : super(key: key);

  final Users user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(
                'https://randomuser.me/api/portraits/men/${user.id}.jpg'),
            backgroundColor: Colors.red,
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(children: [
              const Icon(
                Icons.email,
                size: 30,
              ),
              const SizedBox(
                width: 26.0,
              ),
              Text(
                user.email,
                style: TextStyle(fontSize: 16),
              )
            ]),
          ),
          ExpansionTile(
            leading: const Icon(
              Icons.place,
              size: 30,
              color: Colors.black,
            ),
            title: Text(
                '${user.address.street}, ${user.address.suite}, ${user.address.city}, ${user.address.zipcode}'),
            children: [
              Text(
                  'geoPosition: (${user.address.geo.lat}; ${user.address.geo.lng})'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              children: [
                const Icon(Icons.phone, size: 30),
                const SizedBox(width: 26.0),
                Text(
                  user.phone,
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8),
            child: Row(
              children: [
                const Icon(Icons.web, size: 30),
                const SizedBox(width: 26.0),
                Text(
                  user.website,
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
          ExpansionTile(
            leading: const Icon(Icons.business, size: 30, color: Colors.black),
            title: Text(user.company.name),
            children: [
              Text('catchPhrase: ${user.company.catchPhrase}'),
              Text('bs: ${user.company.bs}'),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Tasks',
            style: Theme.of(context).textTheme.headline6,
          ),
          UserToDosList(userId: user.id),
        ],
      ),
    );
  }
}
