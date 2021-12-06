import 'dart:math';

void main() {
  var myList1 = <int>[3, 17, 16, 35, 24];
  var myList2 = <int>[9, 2, 8, 7, 5];
  var myList3 = <int>[38, 69, -7, -18, 54];

  var kol = 5;
  var i;

  //сортировка вставкой
  var j = 0, x;
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

//сортировка простого выбора
  var minim, n_min;

  for (i = 0; i < kol; i++) {
    minim = myList2[i];
    n_min = i;
    for (j = i + 1; j < kol; j++) {
      if (myList2[j] < minim) {
        minim = myList2[j];
        n_min = j;
      }
    }
    myList2[n_min] = myList2[i];
    myList2[i] = minim;
  }
  for (i = 0; i < kol; i++) {
    print(myList2[i]);
  }

  //метод простого обмена
  for (i = 1; i < kol; i++) {
    for (j = kol - 1; j >= i; j--) {
      if (myList3[j] < myList3[j - 1]) {
        x = myList3[j];
        myList3[j] = myList3[j - 1];
        myList3[j - 1] = x;
      }
    }
  }
  for (i = 0; i < kol; i++) {
    print(myList3[i]);
  }
}
