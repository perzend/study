import 'pupil.dart';

class School extends Pupil {
  int? number;

  //именованный конструктор основанный на конструкторе базового класса
  School.nameAndSchool(String name, this.number) : super.onlyName(name);

  //переопределяем метод для вывода инфо по объекту
  @override
  String toString() {
    var n = (number != null) ? number : "не задан";
    return 'Имя ученика: $name\nНомер школы: $n';
  }
}
