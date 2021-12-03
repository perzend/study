import 'dart:math';

Iterable<int> myGen() sync* {
  var k = 1;
  do {
    yield k;
    k += 7;
  } while (k <= 35);
}

typedef int power(int osn);
power stepen(int step) {
  return (int osn) => pow(osn, step).toInt();
}

int add(int a) {
  if (a <= 9) {
    return a;
  }
  return a % 10 + add(a ~/ 10);
}

void main() {
  var calc = stepen(3);
  print(calc(2));
  print(calc(3));
  print(calc(5));

  var myList = <int>[];
  for (var item in myGen()) {
    myList.add(item);
  }
  print(myList);
  print(add(1789));
}
