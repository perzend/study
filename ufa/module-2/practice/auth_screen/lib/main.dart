import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 60),
              const SizedBox(
                width: 110,
                height: 83,
                child: Placeholder(),
              ),
              const SizedBox(height: 20),
              const Text('Введите логин в виде 10 цифр номера телефона'),
              const SizedBox(height: 20),
              const SizedBox(
                width: 224,
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFeceff1),
                      labelText: 'Телефон'),
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                width: 224,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    labelText: 'Пароль',
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: 154,
                height: 42,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Войти'),
                ),
              ),
              const SizedBox(height: 62),
              InkWell(child: const Text('Регистрация'), onTap: () {}),
              const SizedBox(height: 20),
              InkWell(child: const Text('Забыли пароль?'), onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
