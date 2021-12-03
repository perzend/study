class Person {
  String? name;
  int age = 0;
  int _year = 2021;
  int? emp;
  String? obr;

  String info() =>
      'Имя: $name\nвозвраст: $age\nстаж: $emp\nобразование: $obr\n';

  bool get sover => age > 18;
  int get year => _year;
  set year(int val) {
    _year = val;
  }

  Person() {}
  Person.notName() {
    name = 'ХЗ';
    age = 18;
    emp = 0;
    obr = 'нача';
  }
  Person.notAge(String name, int emp) {
    this.name = name;
    this.emp = emp;
  }
  Person.notEmp(this.name, this.age);

  Person.notObr(username, userage, useremp)
      : name = username,
        age = userage - 10,
        emp = useremp {
    print('Инит');
  }
}

class Worker extends Person with Address {
  String dol = '';
  //Worker() {
  // ;
  // }
  Worker.notobr(String name, int age, int emp, String comp)
      : super.notObr(name, age, emp) {
    dol = 'Секретарь';
    company = comp;
  }
  @override
  String info() =>
      'Имя: $name\nвозвраст: $age\nстаж: $emp\nобразование: $obr\nДолжность: $dol\nАдрес $company';
}

//class Address extends Worker {}

//миксины
mixin Address {
  String company = '';
  void work() {
    print("Адресс $company");
  }
}

void main(List<String> args) {
  Person Vasya = Person()
    ..name = 'Вася'
    ..age = 27
    ..emp = 5
    ..obr = 'Путяга';
   // ..year = 2020;
  print(Vasya.info());
  //print(Vasya.year);

  Person Kuzma = Person();
  Kuzma.name = 'Кузя';
  Kuzma.age = 14;
  Kuzma.obr = 'Школота';
  print(Kuzma.info());

  print('${Vasya.name} совершеннолетний? ${Vasya.sover ? "да" : "нет"}');
  print('${Kuzma.name} совершеннолетний? ${Kuzma.sover ? "да" : "нет"}');

  Person Krot = Person.notName();
  print(Krot.info());

  Krot = Person.notEmp('здорово', 78);
  print(Krot.info());
  Krot = Person.notAge('Пес', -1);
  print(Krot.info());

  Krot = Person.notObr('Hui', 27, 13);
  print(Krot.info());

  Worker pisa = Worker.notobr('Pisa', 13, 5, 'Агагаг');
  print(pisa.info());

  //pisa.company = 'pararar';
  pisa.work();
}
