import 'package:flutter/cupertino.dart';
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

    const floatingLabelStyle = TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );

    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/back.jpg'),
              fit: BoxFit.cover,
              colorFilter:
                  ColorFilter.mode(Colors.white60, BlendMode.lighten),
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 80),
            child: Column(
              children: [
                //const SizedBox(height: 80),
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
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(0, 0, 0, 0.6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    labelText: 'Телефон',
                    floatingLabelStyle: floatingLabelStyle,
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                  ),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    labelText: 'Пароль',
                    floatingLabelStyle: floatingLabelStyle,
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 28),
                SizedBox(
                  width: 154,
                  height: 42,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Войти'),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF0079D0),
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
               // const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
