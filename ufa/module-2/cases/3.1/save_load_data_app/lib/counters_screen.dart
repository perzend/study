import 'package:flutter/material.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:save_load_data_app/counter_storage.dart';

// Класс описывает экран со счетчиками и методы работы с ними.
// Требуется рефакторинг - разделение ui и логики
class CountersScreen extends StatefulWidget {
  const CountersScreen({Key? key, required this.storage}) : super(key: key);

  final CounterStorage storage;

  @override
  State<CountersScreen> createState() => _CountersScreenState();
}

class _CountersScreenState extends State<CountersScreen> {
  int _counter = 0;
  int _counter2 = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
    _loadCounter2();
  }

  // Чтение значения счетчика в соответствующую переменную
  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  void _loadCounter2() {
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter2 = value;
      });
    });
  }

//Увеличение значения счетчика при нажатии на кнопку
  void _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }

  Future<File> _incrementCounter2() {
    setState(() {
      _counter2++;
    });
    return widget.storage.writeCounter(_counter2);
  }

// Удаление счетчика
  void _removeCounter() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('counter');
    _loadCounter();
  }

  void _removeCounter2() {
    widget.storage.deleteFile();
    _loadCounter2();
  }

  // Удаление имени пользователя, счетчиков и возврат к экрану ввода имени
  void _resetSettings() async {
    final prefs = await SharedPreferences.getInstance();

    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Настройки',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5),
            content: Text(
              'Удалить имя пользователя и сбросить счетчики?',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    prefs.remove('name');
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                    _removeCounter();
                    _removeCounter2();
                  },
                  child: const Text('OK')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Oтмена'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // Стиль для кнопок
    ButtonStyle _buttonStyle = ButtonStyle(
        fixedSize: MaterialStateProperty.all(const Size(300, 50)),
        elevation: MaterialStateProperty.all(4),
        enableFeedback: true,
        animationDuration: const Duration(milliseconds: 100));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences and\nReading/Writing Files Demo'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: _resetSettings,
              icon: const Icon(Icons.manage_accounts)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Shared Preferences',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  ElevatedButton(
                    style: _buttonStyle,
                    onPressed: _incrementCounter,
                    child: const Text('Нажать для изменения счетчика'),
                  ),
                  Text(
                    'Количество нажатий: $_counter',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  ElevatedButton(
                      style: _buttonStyle,
                      onPressed: _removeCounter,
                      child: const Text('Удалить значение счетчика')),
                ],
              ),
            ),
            const Divider(
              thickness: 5,
            ),
            SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Reading/Writing Files',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  ElevatedButton(
                    style: _buttonStyle,
                    onPressed: _incrementCounter2,
                    child: const Text('Нажать для изменения счетчика'),
                  ),
                  Text(
                    'Количество нажатий: $_counter2',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  ElevatedButton(
                      style: _buttonStyle,
                      onPressed: _removeCounter2,
                      child: const Text('Удалить файл со значениями счетчика')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
