void myFunction() {
  print('Привет!');
}

void myFunction1(String name) {
  print('Привет,$name');
}

String myFunction2(String name) {
  var str = 'Привет, $name';
  return str;
}

void myFunction5(String name, int date, String month) {
  print('$name рожден $date $month');
}

void myFunction6(
    {required String name, required int date, required String month}) {
  print('$name рожден $date $month');
}

String myFunction7(
    {required String? name, required int date, required String month}) {
  if (name != null) {
    return '$name рожден $date $month';
  }
  return 'Name, plz';
}

String myFunction8(String name, int date, [String? month]) {
  if (month != null) {
    return '$name рожден $date $month';
  }
  return '$name рожден $date ХОЗЕ';
}

void add(List<int> funcList, int b) {
  funcList.add(b);
}

void main() {
  myFunction();
  myFunction1('Пес');
  print(myFunction2('Чепуха'));
  myFunction5('Гена', 17, 'сенвенрня');
  myFunction6(date: 11, month: 'msmsmsm', name: 'Чепуш');
  print(myFunction7(name: 'null', date: 6, month: 'gegege'));
  print(myFunction8('Вуздв', 12, 'modsadjsad'));

  var myList = [1, 2];
  add(myList, 3);
  print(myList);
  
}
