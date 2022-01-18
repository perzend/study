import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:save_load_data_app/welcome_screen.dart';
import 'package:save_load_data_app/counters_screen.dart';
import 'package:save_load_data_app/counter_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {'/': (context) => const WelcomeScreen(),
        '/counters': (context) => CountersScreen(storage: CounterStorage(),)},
    );
  }
}




