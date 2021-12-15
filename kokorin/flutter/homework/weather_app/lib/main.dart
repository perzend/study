import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headline2: TextStyle(
            color: Colors.white70,
            fontSize: 20,
          ),
        ),
      ),
      home: WeatherForecast(),
    );
  }
}

class WeatherForecast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Weather Forecast'),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0.0,
      ),
      body: _buildBody(),
    );
  }
}

// Построение структуры виджетов для body
SingleChildScrollView _buildBody() {
  int _numberOfDaysForecast =
      Random().nextInt(13) + 2; // количество дней для прогноза от 2 до 14
  return SingleChildScrollView(
    child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _searchField(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: _cityDetail(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _temperatureDetail(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _extraWeatherDetail(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: Text(
              '$_numberOfDaysForecast-day weather forecast'.toUpperCase(),
              style: TextStyle(color: Colors.white70, fontSize: 18.0),
            ),
          ),
          _xDayForecast(_numberOfDaysForecast),
        ],
      ),
    ),
  );
}

// Отображание строки поиска
Container _searchField() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: TextField(
      decoration: InputDecoration(
        icon: Icon(
          Icons.search,
          color: Colors.white,
          size: 30.0,
        ),
        labelText: 'Enter City Name',
        labelStyle: TextStyle(color: Colors.white, fontSize: 20),
        border: InputBorder.none,
      ),
    ),
  );
}

// Информация по местоположению и текущей дате клиента
Column _cityDetail() {
  return Column(
    children: [
      Text(
        'Moscow, RU',
        style: TextStyle(color: Colors.white, fontSize: 40.0),
      ),
      Text(
        DateFormat('EEEE, MMM d, yyyy').format(DateTime.now()),
        style: TextStyle(
          color: Colors.white70,
          fontSize: 20,
        ),
      ),
    ],
  );
}

// Отображает текущую температуру и погодные условия
Row _temperatureDetail() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.wb_sunny,
        color: Colors.white,
        size: 70.0,
      ),
      Column(
        children: [
          Text(
            '14 \u2109',
            style: TextStyle(
                color: Colors.white,
                fontSize: 70.0,
                fontWeight: FontWeight.w200),
          ),
          Text(
            'light snow'.toUpperCase(),
            style: TextStyle(
              color: Colors.white70,
              fontSize: 20.0,
              //fontWeight: FontWeight.w200,
            ),
          ),
        ],
      ),
    ],
  );
}

// Дополнительные сведедения о текущей погоде: скорость ветра, влажность, туман
Row _extraWeatherDetail() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BoxedIcon(WeatherIcons.strong_wind, color: Colors.white, size: 30.0),
          Text('5', style: TextStyle(color: Colors.white, fontSize: 26)),
          Text('km/hr', style: TextStyle(color: Colors.white70, fontSize: 18)),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BoxedIcon(WeatherIcons.humidity, color: Colors.white, size: 30.0),
          Text('3', style: TextStyle(color: Colors.white, fontSize: 26)),
          Text('%', style: TextStyle(color: Colors.white70, fontSize: 18)),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BoxedIcon(WeatherIcons.fog, color: Colors.white, size: 30.0),
          Text('20', style: TextStyle(color: Colors.white, fontSize: 26)),
          Text('%', style: TextStyle(color: Colors.white70, fontSize: 18)),
        ],
      ),
    ],
  );
}

// Отображает список с температурой на последующие дни недели начиная с текущего.
Container _xDayForecast(int _countDays) {
  return Container(
    height: 150.0,
    child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        scrollDirection: Axis.horizontal,
        itemExtent: 180.0,
        itemCount: _daysOfWeek(_countDays).length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListTile(
              contentPadding: EdgeInsets.all(16.0),
              tileColor: Colors.white30,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  _daysOfWeek(_countDays)[index],
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${Random().nextInt(51) - 30} \u2109',
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Icon(Icons.wb_sunny, color: Colors.white, size: 50.0),
                ],
              ),
            ),
          );
        }),
  );
}

// Формирование списка с днями недели для ListView
List<String> _daysOfWeek(int countDays) {
  int _numberOfDays = countDays;
  List<String> _listDaysOfWeek = [];

  for (int i = 0; i < _numberOfDays; i++) {
    _listDaysOfWeek.add(
      DateFormat('EEEE').format(
        DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day + i),
      ),
    );
  }
  return _listDaysOfWeek;
}
