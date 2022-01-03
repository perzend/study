import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class PizzaCalc extends StatefulWidget {
  const PizzaCalc({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PizzaCalcState();
  }
}

// объявление перечисления наименования соусов
enum Sauces { spicy, sweetSour, cheese }

class _PizzaCalcState extends State<PizzaCalc> {
  Sauces? _sauces = Sauces.spicy;
  bool _cheeseChek = true;
  int _paste = 1; // 0 - normal, 1 - thin
  double _sizePizza = 400;

  final Color _backColor = const Color(0xFFECEFF1);
  final Color _activeColor = const Color(0xFF0079D0);
  final Color _activeColorRadio = const Color(0xFF5DB075);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    './assets/images/pizza.jpg',
                  ),
                ),
                const SizedBox(height: 33),
                const Text(
                  'Калькулятор пиццы',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
                ),
                const Text(
                  'Выберите параметры:',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 33),

                // Выбор теста
                _choicePaste(),
                const SizedBox(height: 19),

                // Выбор размера пиццы
                const Text(
                  'Размер:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                _choiceSizePizza(),
                //const SizedBox(height: 33),

                // Выбор соуса
                Container(
                  decoration: BoxDecoration(
                    color: _backColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                        style: BorderStyle.solid),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Соус:',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 300, child: _choiceSauce()),
                    ],
                  ),
                ),
                const SizedBox(height: 33),

                // Выбор дополнительного сыра
                SizedBox(width: 300, child: _choiceCheese()),
                const SizedBox(height: 33),

                // Вывод конечной стоимости пиццы
                const Text(
                  'Стоимость:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 34,
                  decoration: BoxDecoration(
                      color: _backColor,
                      borderRadius: BorderRadius.circular(36.0)),
                  child: Text(
                    '${_priceCalculate(paste: _paste, size: _sizePizza, sauce: _sauces, cheese: _cheeseChek)} \u20BD',
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
                const SizedBox(height: 19),

                // Кнопка заказа пиццы
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Заказать'),
                  style: ElevatedButton.styleFrom(
                    primary: _activeColor,
                    textStyle: const TextStyle(fontSize: 16.0),
                    fixedSize: const Size(154, 42),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Виджет выбора теста
  ToggleSwitch _choicePaste() {
    return ToggleSwitch(
      totalSwitches: 2,
      labels: const ['Обычное тесто', 'Тонкое тесто'],
      initialLabelIndex: _paste,
      minHeight: 34.0,
      minWidth: 150.0,
      cornerRadius: 36.0,
      radiusStyle: true,
      activeBgColor: [
        _activeColor,
      ],
      activeFgColor: Colors.white,
      inactiveBgColor: _backColor,
      inactiveFgColor: const Color.fromRGBO(0, 0, 0, 0.4),
      fontSize: 16.0,
      onToggle: (index) {
        setState(() {
          _paste = index;
        });
      },
    );
  }

  //Виджет выбора размера пиццы
  Stack _choiceSizePizza() {
    return Stack(alignment: Alignment.topCenter, children: [
      Container(
        width: 300,
        height: 34,
        decoration: BoxDecoration(
          color: _backColor,
          borderRadius: BorderRadius.circular(36.0),
        ),
      ),
      SizedBox(
        width: 300,
        height: 60,
        child: SliderTheme(
          data: SliderThemeData(
            trackHeight: 5.0,
            thumbShape: const CustomThumbShape(),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 0.0),
            thumbColor: _activeColor,
          ),
          child: Slider(
            inactiveColor: _backColor,
            min: 300,
            max: 500,
            value: _sizePizza,
            onChanged: (value) {
              setState(() {
                _sizePizza = value;
              });
            },
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: Text(
          _nameSizePizza(sizePizza: _sizePizza),
        ),
      ),
    ]);
  }

  // Виджет выбора соуса
  Column _choiceSauce() {
    void _onChangedSauces(Sauces? value) {
      setState(() {
        _sauces = value;
      });
    }

    return Column(
      children: [
        RadioListTile<Sauces>(
          activeColor: _activeColorRadio,
          controlAffinity: ListTileControlAffinity.trailing,
          title: const Text(
            'Острый',
            style: TextStyle(fontSize: 16.0),
          ),
          value: Sauces.spicy,
          groupValue: _sauces,
          onChanged: _onChangedSauces,
        ),
        const Divider(
          height: 0,
          color: Colors.grey,
          thickness: 1,
        ),
        RadioListTile<Sauces>(
          activeColor: _activeColorRadio,
          controlAffinity: ListTileControlAffinity.trailing,
          title: const Text(
            'Кисло-сладкий',
            style: TextStyle(fontSize: 16.0),
          ),
          value: Sauces.sweetSour,
          groupValue: _sauces,
          onChanged: _onChangedSauces,
        ),
        const Divider(
          height: 0,
          color: Colors.grey,
          thickness: 1,
        ),
        RadioListTile<Sauces>(
          activeColor: _activeColorRadio,
          controlAffinity: ListTileControlAffinity.trailing,
          title: const Text(
            'Сырный',
            style: TextStyle(fontSize: 16.0),
          ),
          value: Sauces.cheese,
          groupValue: _sauces,
          onChanged: _onChangedSauces,
        ),
      ],
    );
  }

  // Виджет выбора сыра
  SwitchListTile _choiceCheese() {
    return SwitchListTile(
      tileColor: _backColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      value: _cheeseChek,
      onChanged: (value) {
        setState(() {
          _cheeseChek = !_cheeseChek;
        });
      },
      title: const Text(
        'Дополнительный сыр',
        textAlign: TextAlign.center,
      ),
      secondary: Image.asset('./assets/images/cheese.png'),
    );
  }
}

//Функция возвращает название размера пиццы
String _nameSizePizza({required sizePizza}) {
  List<String> name = ['Маленькая', 'Средняя', 'Большая'];
  String namePizza = '';

  if (sizePizza >= 300 && sizePizza < 400) {
    namePizza = name[0];
  } else if (sizePizza >= 400 && sizePizza < 500) {
    namePizza = name[1];
  } else if (sizePizza == 500) {
    namePizza = name[2];
  }

  return namePizza;
}

// Функция расчета конечной стоимости пиццы
int _priceCalculate(
    {required int paste,
    required double size,
    required Sauces? sauce,
    required bool cheese}) {
  int totalPrice = 0;

  // тесто: обычное (0) - 150, тонкое (1) - 100
  List<int> pricePaste = [150, 100];

  // стоимость размера: маленькая, средняя, большая
  List<int> prizeSizePizza = [300, 400, 500];

  // соус острый - 50, кисло-сладкий - 75, сырный - 33
  int priceSpicySauce = 50;
  int priceSweetSourSauce = 75;
  int priceCheeseSauce = 33;

  // дополнительный сыр - 69
  int priceCheese = 69;

  totalPrice += pricePaste[paste];

  if (size >= 300 && size < 400) {
    totalPrice += prizeSizePizza[0];
  } else if (size >= 400 && size < 500) {
    totalPrice += prizeSizePizza[1];
  } else if (size == 500) {
    totalPrice += prizeSizePizza[2];
  }

  if (sauce == Sauces.spicy) {
    totalPrice += priceSpicySauce;
  } else {
    if (sauce == Sauces.sweetSour) {
      totalPrice += priceSweetSourSauce;
    } else {
      if (sauce == Sauces.cheese) totalPrice += priceCheeseSauce;
    }
  }

  if (cheese) totalPrice += priceCheese;

  return totalPrice;
}

// Рисуем собственный указатель ползунка
class CustomThumbShape extends SliderComponentShape {
  const CustomThumbShape();

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(20, 60);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;
    final paint = Paint()
      ..color = sliderTheme.thumbColor!
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(center.dx, center.dy - 3);
    path.lineTo(center.dx + 7, center.dy + 7);
    path.lineTo(center.dx + 7, center.dy + 21);
    path.lineTo(center.dx - 7, center.dy + 21);
    path.lineTo(center.dx - 7, center.dy + 7);
    path.close();

    canvas.drawPath(path, paint);
  }
}
