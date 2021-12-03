import 'dart:math';
import 'pupil.dart';
import 'school.dart';

//формируем произвольный список оценок
List<int> listRndGrades() {
  List<int> listGrades = [];
  Random random = Random();
  for (var i = 0; i < random.nextInt(50); i++) {
    listGrades.add(random.nextInt(4) + 2);
  }
  return listGrades;
}

void main(List<String> arguments) {
  //имитируем ввод данных извне
  Pupil pupil1 = Pupil(name: 'Дружинин Артем', age: 12, rating: 4.5);
  Pupil pupil2 = Pupil.noRate('Лукьянов Антон', 15);
  Pupil pupil3 = Pupil.onlyName('Пожерицкая Мария');
  Pupil pupil4 = Pupil(name: 'Решетникова Наталья', age: 13);
  Pupil pupil5 = Pupil.noRate('Прокашев Олег', 12);
  Pupil pupil6 = Pupil.onlyName('Соловьева Елизавета');
  Pupil pupil7 = Pupil(name: 'Иванов Юрий', age: 14, rating: 4.1);
  Pupil pupil8 = Pupil.noRate('Демидова Анастасия', 16);
  Pupil pupil9 = Pupil.onlyName('Антонов Вячеслав');
  Pupil pupil10 = Pupil(name: 'Евдокимов Сергей', age: 13, rating: 4.5);
  Pupil pupil11 = Pupil.onlyName('Пожерицкая Мария');
  Pupil pupil12 = Pupil(name: 'Иванов Юрий', age: 12, rating: 3.8);

  List<Pupil> pupils = [
    pupil1,
    pupil2,
    pupil3,
    pupil4,
    pupil5,
    pupil6,
    pupil7,
    pupil8,
    pupil9,
    pupil10,
    pupil11,
    pupil12
  ];

//Зададим некоторым ученикам возраст и средний балл используя доступное свойство
//класса и сеттер для защищенного свойства
  pupil6.age = 17;
  pupil11.age = 13;
  pupil8.setRate = 3.9;
  pupil9.setRate = 4.5;

//Зададим всем ученикам без среднего балла его значение, используя метод класса
//по его подсчету на основе введенных оценок.
  for (var item in pupils) {
    if (item.showRateOnly() == null) {
      item.setRateFromGrades(listRndGrades());
    }
  }

//Выведем данные всех учеников
  for (var i = 0; i < pupils.length - 1; i++) {
    print('*' * 40);
    print(pupils[i]);
  }

//Выведем учеников со средним баллом 4.5
  print('#' * 100);
  print('Ученики со средним баллом 4.5:');
  for (var item in pupils) {
    item.showWithGoodRate(4.5);
  }

  //создание и вывод объекта через класс-наследник
  print('#' * 100);
  School pupil13 = School.nameAndSchool('Сидоров Петр', 1381);
  print(pupil13);

// задаем одинковые параметры объктам и сравниваем
  pupil3.age = 14;
  pupil3.setRate = 4.5;
  pupil11.age = 14;
  pupil11.setRate = 4.5;
  print('#' * 100);
  if (pupil3 == pupil11) {
    print('Найдены ученики с одинаковыми значениями полей!\n$pupil3');
  }
}
