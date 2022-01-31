import 'package:final_project/routes/routes.dart';
import 'package:final_project/services/secure_storage.dart';
import 'package:final_project/widgets/drawer.dart';
import 'package:flutter/material.dart';


// При нажатии на кнопку удаляем все данные в сторадже и переходим на страницу авторизации
class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  static const String routeName = '/settings';

  final SecureStorage _secureStorage = SecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              _secureStorage.deleteAll();
              Navigator.pushReplacementNamed(context, Routes.authPage);
            },
            child: const Text('Delete user')),
      ),
    );
  }
}
