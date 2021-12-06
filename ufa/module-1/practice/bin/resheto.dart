import 'dart:core';

void main(List<String> args) {
  var myList1 = <int>[];
  var myList2 = <int>[];
  var myList3 = [];
  var kol = 1000;
  for (var i = 0; i < kol; i++) {
    myList1.add(i + 1);
    myList2.add(1);
  }

  for (var k = 2; k * k < kol; k++) {
    if (myList2[k - 1] != 0) {
      for (var i = 2 * k - 1; i < kol; i += k) {
        myList2[i] = 0;
      }
    }
  }

  for (var i = 0; i < kol; i++) {
    if (myList2[i] == 1) {
      myList3.add(myList1[i]);
    }
  }
  print(myList3);
}
