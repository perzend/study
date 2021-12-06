// Задание 3. Бинарный поиск.

import 'dart:math';

// Рекурсивная функция бинарного поиска. Возвращает индекс искомого значения
// (или индекс одного из значений, если они повторяются в списке) или -1 - если
// значение не найдено.

int recBinSearch(List<int> xList, int key, int leftIndex, int rightIndex) {
  if (rightIndex < leftIndex) return -1;
  int middleIndex = (leftIndex + rightIndex) ~/ 2;
  if (key < xList[middleIndex]) {
    return recBinSearch(xList, key, leftIndex, middleIndex - 1);
  }
  if (key > xList[middleIndex]) {
    return recBinSearch(xList, key, middleIndex + 1, rightIndex);
  }
  if (key == xList[middleIndex]) {
    return middleIndex;
  }
  return -1;
}

// Итеративная функция бинарного поиска. Возвращает индекс искомого значения
// (или индекс одного из значений, если они повторяются в списке) или -1 - если
// значение не найдено.
int binarySearch(List<int> xList, int key) {
  var leftIndex = 0;
  var rightIndex = xList.length - 1;
  int middleIndex;

  while (leftIndex <= rightIndex) {
    middleIndex = (leftIndex + rightIndex) ~/ 2;
    if (key == xList[middleIndex]) {
      return middleIndex;
    }
    if (key < xList[middleIndex]) {
      rightIndex = middleIndex - 1;
    } else {
      leftIndex = middleIndex + 1;
    }
  }
  return -1;
}

// Итеративная функция левостороннего бинарного поиска. Возвращает индекс
// искомого значения (или индекс первого значения, если они повторяются в
// списке) или -1, если значение не найдено
int leftBinarySearch(List<int> xList, int key) {
  var leftIndex = -1;
  var rightIndex = xList.length;
  var middleIndex = 0;

  while (leftIndex < rightIndex - 1) {
    middleIndex = (leftIndex + rightIndex) ~/ 2;
    if (xList[middleIndex] < key) {
      leftIndex = middleIndex;
    } else {
      rightIndex = middleIndex;
    }
  }
  // Проверка на искомое значение вне списка
  return rightIndex == xList.length || xList[rightIndex] != key
      ? -1
      : rightIndex;
}

// Итеративная функция правостороннего бинарного поиска. Возвращает индекс
// искомого значения (или индекс последнего значения, если они повторяются в
// списке) или -1, если значение не найдено
int rightBinarySearch(List<int> xList, int key) {
  var leftIndex = -1;
  var rightIndex = xList.length;
  var middleIndex = 0;

  while (leftIndex < rightIndex - 1) {
    middleIndex = (leftIndex + rightIndex) ~/ 2;
    if (xList[middleIndex] <= key) {
      leftIndex = middleIndex;
    } else {
      rightIndex = middleIndex;
    }
  }
  // Проверка на искомое значение вне списка
  return leftIndex == -1 || xList[rightIndex - 1] != key ? -1 : rightIndex - 1;
}

//Функция для вывода результатов левостороннего и правостороннего бинарного поиска
void resLRBinarySearch(List<int> xList, int key) {
  var resLeft = leftBinarySearch(xList, key);
  var resRight = rightBinarySearch(xList, key);
  if (resLeft != resRight) {
    return print(
        'Искомое значение $key повторяется в диапазоне от ${resLeft + 1} до ${resRight + 1} элемента исходного списка\n');
  }
  if (resLeft == -1 && resRight == -1) {
    return print('Искомое значение не найдено\n');
  }
  if (resLeft == resRight && resLeft != -1 && resRight != -1) {
    print('Искомое значение $key - это ${resLeft + 1} элемент списка\n');
  }
}

void main(List<String> args) {
  var myList = [5, 6];
  var myList2 = List.generate(15, (_) => Random().nextInt(100) - 30);
  var k = 4; // Искомое значение
  myList2.sort();

  print(
      'Результат выполнения функции бинарного поиска для зараннее сформированного списка:\n$myList');
  var resBS = binarySearch(myList, k);
  if (resBS == -1) {
    print("Искомое значение не найдено!\n");
  } else {
    print('Искомое значение $k - это ${resBS + 1} элемент списка\n');
  }
  print(
      'Результат выполнения функции бинарного поиска для списка с рандомными значениями:\n$myList2');
  resBS = binarySearch(myList2, k);
  if (resBS == -1) {
    print("Искомое значение не найдено!\n");
  } else {
    print('Искомое значение $k - это ${resBS + 1} элемент списка\n');
  }

  print(
      'Результат выполнения функции левого и правого бинарного поиска для зараннее сформированного списка:\n$myList');
  resLRBinarySearch(myList, k);
  print(
      'Результат выполнения функции левого и правого бинарного поиска для списка с рандомными значениями:\n$myList2');
  resLRBinarySearch(myList2, k);

  print(
      'Результат выполнения рекурсивной функции бинарного поиска для зараннее сформированного списка:\n$myList');
  resBS = recBinSearch(myList, k, 0, myList.length - 1);
  if (resBS == -1) {
    print("Искомое значение не найдено!\n");
  } else {
    print('Искомое значение $k - это ${resBS + 1} элемент списка\n');
  }
}
