// ДЗ по условным выражениям и циклам
// Задача 2. Найти сколько цифр в числе
import 'dart:io';

void main() {
  print('Введите целое положительное число:');
  int value = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
  int counter = 0;

  if (value <= 0) {
    print('Число должно быть положительным целым!');
  } else {
    while (value > 0) {
      counter++;
      value = value ~/ 10;
    }
    print('Количество цифр в числе: $counter');
  }
}
