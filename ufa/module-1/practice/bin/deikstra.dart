import 'dart:math';

void main(List<String> args) {
  var size = 6;

  List<List<int>> a = [
    [0, 7, 9, 0, 0, 14],
    [7, 0, 10, 15, 0, 0],
    [9, 10, 0, 11, 0, 2],
    [0, 15, 11, 0, 6, 0],
    [0, 0, 0, 6, 0, 9],
    [14, 0, 2, 0, 9, 0]
  ];
  List<int> d = [];
  List<int> v = [];

  int temp, minindex, min, i, j;
  int beginIndex = 0;

  for (i = 0; i < size; i++) {
    d.add(10000);
    v.add(1);
  }

  d[beginIndex] = 0;
  do {
    minindex = 10000;
    min = 10000;
    for (i = 0; i < size; i++) {
      if (v[i] == 1 && d[i] < min) {
        min = d[i];
        minindex = i;
      }
    }
    if (minindex != 10000) {
      for (i = 0; i < size; i++) {
        if (a[minindex][i] > 0) {
          temp = min + a[minindex][i];
          if (temp < d[i]) {
            d[i] = temp;
          }
        }
      }
      v[minindex] = 0;
    }
  } while (minindex < 10000);
  print(d);

  List<int> ver = [];
  int end = size - 1;
  ver.add(end + 1);
  for (i = 0; i < size; i++) {
    ver.add(0);
  }
  int k = 1;
  int weight = d[end];
  while (end != beginIndex) {
    for (i = 0; i < size; i++) {
      if (a[i][end] != 0) {
        temp = weight - a[i][end];
        if (temp == d[i]) {
          weight = temp;
          end = i;
          ver[k] = i + 1;
          k++;
        }
      }
    }
  }
  print(ver);
  print(ver.reversed);
  for (var i = k - 1; i >= 0; i--) {
    print(ver[i]);
  }
}
