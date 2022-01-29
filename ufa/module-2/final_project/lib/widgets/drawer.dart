import 'package:final_project/routes/routes.dart';
import 'package:final_project/services/secure_storage.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  NavDrawer({Key? key}) : super(key: key);
  final SecureStorage _secureStorage = SecureStorage();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
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
    );
  }
}

Widget _createHeader() {
  return DrawerHeader(
    child: SizedBox(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/320px-Google-flutter-logo.svg.png',
            ),
          ),
          const Text('Навигация во Flutter'),
        ],
      ),
    ),
  );
}

Widget _createDrawerItem(
    {required IconData icon,
    required String text,
    required GestureTapCallback onTap}) {
  return ListTile(leading: Icon(icon), title: Text(text), onTap: onTap);
}
