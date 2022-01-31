import 'package:final_project/module/auth/auth_page.dart';
import 'package:final_project/module/auth/welcome_page.dart';
import 'package:final_project/module/settings_view.dart';
import 'package:final_project/module/users/users_list_view.dart';
import 'package:final_project/services/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:final_project/routes/routes.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final SecureStorage secureStorage = SecureStorage();
  String? loginStatus;
  loginStatus = await secureStorage.readSecureData('login_status');

  String? phone;
  phone = await secureStorage.readSecureData('phone');

  String? pwd;
  pwd = await secureStorage.readSecureData('pwd');

  runApp(MaterialApp(
    theme: ThemeData(appBarTheme: const AppBarTheme(color: Colors.grey)),
    debugShowCheckedModeBanner: false,
    home: loginStatus == 'isOK' ? WelcomePage(phone: phone,) : AuthPage(phone:phone, pwd:pwd),
    routes: {
      Routes.usersList: (context) => const UsersListPage(),
      Routes.settings: (context) => SettingsPage(),
      Routes.authPage: (context) => AuthPage(phone:phone, pwd:pwd),
    },
  ));
}
