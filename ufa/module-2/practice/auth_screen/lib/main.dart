import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(color: Color(0xFFbbbbbb), width: 2));
    const linkTextStyle = TextStyle(
      fontSize: 18,
      color: Color(0xFF0079D0),
      fontWeight: FontWeight.bold,
    );

    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/back.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.white60, BlendMode.colorDodge),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 60),
              const SizedBox(
                width: 110,
                height: 83,
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Введите логин в виде 10 цифр номера телефона',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(0, 0, 0, 0.6),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                width: 224,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    labelText: 'Телефон',
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                  ),
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
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
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
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0079D0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 62),
              InkWell(
                  child: const Text(
                    'Регистрация',
                    style: linkTextStyle,
                  ),
                  onTap: () {}),
              const SizedBox(height: 20),
              InkWell(
                  child: const Text(
                    'Забыли пароль?',
                    style: linkTextStyle,
                  ),
                  onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
