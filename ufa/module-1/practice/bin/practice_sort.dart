void main() {
  var myList1 = <int>[1, 3, 19, 5, 10, 14];
  var kol = 6;
  var i = 0, j = 0, x = 0;
  for (i = 1; i < 5; i++) {
    x = myList1[i];
    j = i - 1;
    while (x < myList1[j] && j >= 0) {
      myList1[j + 1] = myList1[j];
      if (j > 0) j--;
    }
    myList1[j + 1] = x;
  }
  for (i = 0; i < kol; i++) {
    print(myList1[i]);
  }

  var key = 3;
  var indexKey = -1;
  var middleValue;
  var right = 5;
  var left = 0;
  bool flag = false;

  while ((left <= right) && (flag != true)) {
    middleValue = (right + left) ~/ 2;
    if (key < myList1[middleValue]) {
      right = middleValue - 1;
    } else {
      if (key > myList1[middleValue]) {
        left = middleValue + 1;
      } else {
        indexKey = middleValue;
        flag = true;
      }
    }
    if (left > right) flag = true;
  }
  if (indexKey == -1) {
    print('cancel');
  } else {
    print('$key по индексу ${indexKey +1}');
  }
}
