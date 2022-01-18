import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Класс описывает начальный экран для ввода и отображения имени
// Требует рефакторинга
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // Для работы с TextField
  late TextEditingController _controller;

  // Для задержки перехода на другой экран и обратного отсчета
  Timer? _timer;
  int _startTimer = 5;

  // Введенное в TextField значение
  String? _name;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    // Сначала читаем сохраненное значение и кладем его в _name и если не null
    // переходим с задержкой на экран счетчиков
    _loadName().whenComplete(() {
      if (_name != null) {
        _timerNextScreen();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _timer?.cancel();
  }

// Ведет обратный отсчет и на нуле переходит на экран счетчиков
  void _timerNextScreen() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_startTimer == 0) {
          setState(() {
            timer.cancel();
            //Navigator.pushNamed(context, '/counters');
            Navigator.pushNamedAndRemoveUntil(
                context, '/counters', (route) => false);
          });
        } else {
          setState(() {
            _startTimer--;
          });
        }
      },
    );
  }

  // Сохранение имени
  void _saveName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
  }

  // Загрузка сохраненного имени
  // Future для того чтобы выполнить условие в initState
  Future _loadName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name');
    });
  }

  // Если имя не задано
  Widget _nameIsNotSpecified() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Добро пожаловать!',
          style: Theme.of(context).textTheme.headline4,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _controller,
            onSubmitted: (String value) async {
              if (value.startsWith(' ') || value.isEmpty) {
                await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Правила для ввода имени',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline5),
                        content: Text(
                          '1. Должно быть не меньше 1 и не больше 70 символов\n'
                          '2. Не должно начинаться с пробела\n'
                          '3. Должно содержать только строчные и/или заглавные '
                          'буквы латинского и русского алфавитов',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'))
                        ],
                      );
                    });
              } else {
                _saveName(value);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/counters', (route) => false);
              }
            },
            decoration: InputDecoration(
              labelText: 'Введите Ваше Имя...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            keyboardType: TextInputType.name,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Zа-яА-Я ]')),
            ],
            maxLength: 70,
          ),
        ),
      ],
    );
  }

// Если имя задано
  Widget _nameIsSpecified() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Добро пожаловать, $_name!',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(
          height: 16.0,
        ),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SizedBox(
              width: 100,
              height: 50,
              child: CircularProgressIndicator(
                value: _startTimer * 0.2,
                color: Colors.red,
                backgroundColor: Colors.blue,
                strokeWidth: 10.0,
              ),
            ),
            Text(
              '$_startTimer',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences and\nReading/Writing Files Demo'),
        centerTitle: true,
      ),
      // Тут конечно лажа. Получается вторая такая же проверка как и в initState
      // Всегда сначала прорисовывается виджет при значении null, не успевает
      // инициализация что-ли. Может надо разделить на два экрана вообще, а не виджета
      body: (_name != null) ? _nameIsSpecified() : _nameIsNotSpecified(),
    );
  }
}
