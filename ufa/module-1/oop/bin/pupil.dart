class Pupil {
  String? name;
  int? age;
  double? _rating;

  //конструктор по умолчанию с использованием именованных параметров
  //и обязательным указанием имени и возраста
  Pupil({required this.name, required this.age, rating}) : _rating = rating;
  //именованный конструктор только для имени и возраста, rating = null
  Pupil.noRate(this.name, this.age);
  //именованный конструктор только для имени, использующий конструктор
  //класса по умолчанию, age = null , rating = null
  Pupil.onlyName(String pupilName) : this(name: pupilName, age: null);

//выводит ученика с заданным средним баллом
  void showWithGoodRate(double r) {
    if (_rating == r) {
      print('|$name|');
    }
  }

//сеттер для задания среднего балла
  set setRate(double r) => _rating = r;
//метод возвращает средний балл
  double? showRateOnly() {
    return _rating;
  }

  //метод формирования среднего балла на основе введенных оценок.
  //если оценок нет, то ср. балл ноль.
  void setRateFromGrades(List<int> grades) {
    if (grades.isEmpty) {
      _rating = 0;
    } else {
      _rating = double.parse(
          ((grades.reduce((value, element) => (value + element)) /
                  grades.length))
              .toStringAsFixed(1));
    }
  }

//переопределяем оператор сравнения чтобы сравнивать объекты класса.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pupil &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age &&
          _rating == other._rating;
  @override
  int get hashCode => name.hashCode ^ age.hashCode ^ _rating.hashCode;

//переопределяем стандартный метод toString для вывода инфо
//по объекту нашего класса через print();
  @override
  String toString() {
    var a = (age != null) ? age : "не задан";
    var r = (_rating != null) ? _rating : "не задан";
    return 'Имя ученика: $name\nВозраст: $a\nСредний балл: $r';
  }
}
