import 'dart:math';

void main() {
  var myList1 = <int>[]; //пустой список
  var myList2 = <int>[]; //пустой список
  var kol = 5;
  var rng = new Random();
  var i = 0;
  //генерация с помощью случайных чисе
  for (i = 0; i < kol; i++) {
    myList1.add(rng.nextInt(100) - 20);
    print(myList1[i]);
  }
  var x = 0;
  var j = 0;
  //реверс массива
  j = kol - 1;
  for (i = 0; i < j; i++) {
    x = myList1[i];
    myList1[i] = myList1[j];
    myList1[j] = x;
    j--;
  }
  print('Реверс:');
//вывод массива
  for (i = 0; i < kol; i++) {
    print(myList1[i]);
  }
  print('Реверс:');
  myList2 = List.from(myList1.reversed); //встроенный в Dart метод реверса
  for (i = 0; i < kol; i++) print(myList2[i]);
  myList2.forEach(print);
}
