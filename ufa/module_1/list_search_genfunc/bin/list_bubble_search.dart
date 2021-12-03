import 'dart:math';

void main(List<String> args) {
  var myList = List.generate(15, (_) => Random().nextInt(100) - 50);
  var temp = 0;
  var countListElements = myList.length;

  print('Исходный список: $myList');
  for (int j = 1; j < countListElements; j++) {
    for (int i = 0; i < countListElements - j; i++) {
      temp = myList[i];
      if (myList[i] > myList[i + 1]) {
        myList[i] = myList[i + 1];
        myList[i + 1] = temp;
      }
    }
  }
  print('Отсортированный список: $myList');
}
