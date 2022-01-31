import 'package:final_project/routes/routes.dart';
import 'package:final_project/services/secure_storage.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  NavDrawer({Key? key}) : super(key: key);
  final SecureStorage _secureStorage = SecureStorage();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/back3.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            padding: EdgeInsets.zero,
            children: [
              _createHeader(),
              _createDrawerItem(
                  icon: Icons.people,
                  text: 'List of users',
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, Routes.usersList)),
              _createDrawerItem(
                  icon: Icons.settings,
                  text: 'Settings',
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, Routes.settings)),
              _createDrawerItem(
                  icon: Icons.logout,
                  text: 'Logout',
                  onTap: () {
                    _secureStorage.deleteSecureData('login_status');
                    Navigator.pushReplacementNamed(context, Routes.authPage);
                  })
            ],
          ),
        ]
      ),
    );
  }
}

Widget _createHeader() {
  return DrawerHeader(
    decoration:  BoxDecoration(
  image: DecorationImage(
  image: AssetImage("assets/images/back5.jpg"),
  fit: BoxFit.cover,
  ),
  ),
child: Text('FINAL_PROJECT',),
  );
}

Widget _createDrawerItem(
    {required IconData icon,
    required String text,
    required GestureTapCallback onTap}) {
  return ListTile(leading: Icon(icon), title: Text(text, style: TextStyle(fontSize: 24.0),), onTap: onTap);
}
