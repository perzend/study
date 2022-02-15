// ДЗ по условным выражениям и циклам
// Задача 3. Определить к какому веку принадлежит введенный год

import 'dart:io';

void main() {
  stdout.write('Введите год: ');
  int year = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
  if (year <= 0) {
    print('Год должен быть положительным целым числом!');
  } else {
    var age = year ~/ 100;
    if (year % 100 != 0) {
      age++;
    }
    print('Этот год принадлежит $age веку.');
  }
}
