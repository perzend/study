import 'package:flutter/material.dart';
import 'package:pizza_calc_theme/utils/global_theme.dart';
import 'package:toggle_switch/toggle_switch.dart';

class PizzaCalcApp extends StatelessWidget {
  const PizzaCalcApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme(),
      home: const PizzaCalcScreen(),
    );
  }
}

// объявление перечисления наименования соусов
enum Sauces { spicy, sweetSour, cheese }

class PizzaCalcScreen extends StatefulWidget {
  const PizzaCalcScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PizzaCalcScreenState();
  }
}

class _PizzaCalcScreenState extends State<PizzaCalcScreen> {
  Sauces? _sauces = Sauces.spicy;
  bool _cheeseChek = true;
  int _paste = 1; // 0 - normal, 1 - thin
  double _sizePizza = 400;

  final Color _activeColor = const Color(0xFF0079D0);
  final Color _activeColorRadio = const Color(0xFF5DB075);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  './assets/images/pizza.png',
                ),
              ),
              const SizedBox(height: 33),
              Text(
                'Калькулятор пиццы',
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                'Выберите параметры:',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 33),

              // Выбор теста
              _choicePaste(),
              const SizedBox(height: 19),

              // Выбор размера пиццы
              Text(
                'Размер:',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 5),
              _choiceSizePizza(),
              //const SizedBox(height: 33),

              // Выбор соуса
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                      color: Colors.grey, width: 1.0, style: BorderStyle.solid),
                ),
                child: Column(
                  children: [
                    Text(
                      'Соус:',
                      style: Theme.of(context).textTheme.headline6,
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
              Text(
                'Стоимость:',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 5),
              Container(
                alignment: Alignment.center,
                width: 300,
                height: 34,
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.circular(36.0)),
                child: Text(
                  '${_priceCalculate(paste: _paste, size: _sizePizza, sauce: _sauces, cheese: _cheeseChek)} руб.',
                    style: Theme.of(context).textTheme.headline6,
                ),
              ),
              const SizedBox(height: 19),

              // Кнопка заказа пиццы
              ElevatedButton(
                onPressed: () {},
                child: Text('Заказать', style: Theme.of(context).textTheme.bodyText2,),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.secondary,
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
        _activeColor, Theme.of(context).colorScheme.secondary,
      ],
      activeFgColor: Colors.white,
      inactiveBgColor: Theme.of(context).backgroundColor,
      inactiveFgColor: const Color.fromRGBO(0, 0, 0, 0.4),
      customTextStyles: [
        Theme.of(context).textTheme.bodyText2,
        Theme.of(context).textTheme.bodyText2,
      ],
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
          color: Theme.of(context).backgroundColor,
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
            inactiveColor: Theme.of(context).backgroundColor,
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
          style: Theme.of(context).textTheme.bodyText2,
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
          title:  Text(
            'Острый',
            style: Theme.of(context).textTheme.bodyText2,
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
          title: Text(
            'Кисло-сладкий',
            style: Theme.of(context).textTheme.bodyText2,
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
          title:  Text(
            'Сырный',
            style: Theme.of(context).textTheme.bodyText2,
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
      tileColor: Theme.of(context).backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      value: _cheeseChek,
      onChanged: (value) {
        setState(() {
          _cheeseChek = !_cheeseChek;
        });
      },
      title: Text(
        'Дополнительный сыр',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText2,
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
