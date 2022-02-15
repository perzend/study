// ДЗ по условным выражениям и циклам
// Задача 1. Числа кратные 3 заменить на Super, кратные 5 на Quiz,
// выполняющие оба условия на SuperQuiz
import 'dart:io';

void main() {
  for (int i = 1; i <= 100; i++) {
    stdout.write('$i. ');
    if (i % 3 == 0 && i % 5 == 0) {
      print('Super Quiz');
    } else if (i % 3 == 0) {
      print('Super');
    } else if (i % 5 == 0) {
      print('Quiz');
    } else
      print(i);
  }
}
