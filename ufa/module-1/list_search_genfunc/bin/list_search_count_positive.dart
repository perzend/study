import 'dart:math';

void main(List<String> arguments) {
  var myList = <int>[];
  var countElementsInList = 10;
  var countPositiveElements = 0;

  //наполнение списка элементами
  for (int i = 0; i < countElementsInList; i++) {
    myList.add(Random().nextInt(100) - 50);
  }

  //поиск количества положительных элементов
  for (var element in myList) {
    if (element > 0) {
      countPositiveElements++;
    }
  }

  print(
      'Количество положительных элементов в массиве $myList равняется $countPositiveElements');
}
