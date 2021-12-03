// @dart=2.9

import 'dart:collection';
import 'dart:core';
import 'dart:ffi';
import 'package:extended_math/extended_math.dart';

void main(List<String> args) {
  var myList1 = <List>[
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  var myList2 = <List>[];
  print(myList1[1][1]);

  for (int i = 0; i < 3; i++) {
    myList2.add([i, i + 1, i + 2]);
  }
  print(myList2);

  int kol = 0;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (myList2[i][j] > 2) kol++;
    }
  }
  print(kol);
  int size = 5;
  List<List<int>> matrix = new List<List<int>>(size);
  for (int i = 0; i < size; i++) {
    List<int> list = new List<int>(size);
    for (var j = 0; j < size; j++) {
      list[j] = j * i;
    }
    matrix[i] = list;
  }
  print(matrix);
  print(matrix[4][3]);

  var matrix2 = Matrix.generate(4, 4);
  print(matrix2);
  var matrix3 = Matrix.identity(5, 5);
  print(matrix3);

  matrix2.appendRow([1, 2, 3, 4]);
  matrix2.appendColumn([5, 4, 3, 2, 5]);
  matrix2.matrixProduct(matrix3);
  matrix2.removeColumn(2);
  matrix2.removeRow(2);
  matrix2.replaceColumn(1, [56, 56, 3, 2]);
  matrix2.replaceRow(2, [999, 999, 999, 999]);
  print(matrix2);

// множества

  var sets = {1, 3, 2, 4, 9};
  Set<int> sets2 = {2, 4, 6, 8, 0};
  Set<String> sets3 = {'moscow', 'ufo', 'russia', 'penza', 'шляпа'};

  sets3.remove('ufo');
  print(sets3);
  print(sets2.contains(3));
  var set4 = sets.intersection(sets2);
  print(set4);

//map

  var map = {"Россия": "Москва", "Чехия": "Прага", "США": "Нью-Йорк"};
  map.addAll({"Болгария": "Ххз", "Испания": "Мадрид"});
  print(map);
  map.addEntries([MapEntry('key', 'value')]);
  print(map);
  print(map.keys);
  print(map.entries);
  print(map.values);
  print(map.length);

  print(map.containsKey('США'));
  print(map.containsValue('Ххз'));

  //string, runes

  Runes text1 = Runes('Привет!');
  print(text1);
  print(String.fromCharCodes(text1));

  String tom = 'Nom';
  String jerry = 'Jerry';
  String res;
  res = tom + ' ' + jerry;
  print(res);
  print(tom.runes);
  print(tom.toUpperCase());
  print(tom.contains('other'));
}
