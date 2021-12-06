var up = 'верхний уровень';
void myFunction1() {
  print(up);
  var down1 = 'переменная myFunction1';
  void myFunction2() {
    print(down1);
    var down2 = 'переменная myFunction2';
    void myFunction3() {
      print(up);
      print(down1);
      print(down2);
    }

    myFunction3();
  }

  myFunction2();
}

typedef int add1(int a, int b);
int add(int a, int b) => a + b;

int sub(int c, int b, int a, add1 func) {
  return c * func(a, b);
}

/*int add(int a, int b) {
  return a + b;
}

int sub(int c, int b, int a, int Function(int a, int b) func) {
  return c * func(a, b);
}*/

void main() {
  myFunction1();
  var myAdd = add;
  print(myAdd(5, 2));
  print(sub(5, 2, 3, add));

  var myList = ['анонимная', 'функция'];
  myList.forEach((element) {
    print('Индекс ${myList.indexOf(element)} значение $element');
  });
}
