//Задание 3. Составить распорядок дня с помощью оператора
//множественного выбора

import 'dart:io';

void main() {
  String? time;
  RegExp exp;
  int timeInt;

  stdout.write('Введите интересующее Вас время в 24-х часом формате (ЧЧ:ММ): ');
  time = stdin.readLineSync();

  exp = RegExp(r"^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]");
  if (exp.hasMatch(time!)) {
    timeInt = int.parse(time.replaceAll(':', ''));
  } else {
    return print(
        'Введенное время должно быть от 00:00 до 23:59! Попробуйте еще раз.');
  }

  stdout.write("Сейчас по расписанию: ");
  if ((timeInt >= 0 && timeInt < 630) || (timeInt > 2300 && timeInt <= 2359)) {
    return print("время для сна...");
  }

  switch (timeInt) {
    case 630:
      return print('подъем');
    case 700:
      return print('утренний туалет');
    case 730:
      return print('зарядка');
    case 800:
      return print('просмотр новостей, сообщений');
    case 830:
      return print('приготовление завтрака');
    case 900:
    case 930:
      return print('завтрак');
    case 1000:
    case 1030:
    case 1100:
    case 1130:
    case 1200:
      return print('тренировка на улице');
    case 1230:
      return print('приготовление обеда');
    case 1300:
    case 1330:
      return print('обед');
    case 1400:
    case 1430:
    case 1500:
    case 1530:
    case 1600:
    case 1630:
    case 1700:
      return print('изучение Flutter');
    case 1730:
      return print('приготовление ужина');
    case 1800:
    case 1830:
      return print('ужин');
    case 1900:
    case 1930:
    case 2000:
    case 2030:
    case 2100:
    case 2130:
      return print('изучение Flutter');
    case 2200:
    case 2230:
      return print('вечерний туалет');
    case 2300:
      return print('отбой');

    default:
      print(
          'определенно что-то происходит. Попробуйте задавать время с шагом в 30 минут.');
  }
}

/*
07:00 - Подъем
07:10 - Утренний туалет
07:30 - Зарядка
08:00 - Просмотр новостей, сообщений
08:30 - Приготовление завтрака
09:00 - Завтрак
10:00 - Тренировка на улице
12:30 - Приготовление обеда
13:00 - Обед
14:00 - Изучаем Flutter
17:30 - Приготовление ужина
18:00 - Ужин
19:00 - Изучаем Flutter
22:00 - Вечерний туалет
23:00 - Отбой
 */