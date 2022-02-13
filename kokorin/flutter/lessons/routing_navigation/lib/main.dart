import 'package:flutter/material.dart';
import 'package:routing_navigation/data_transfer_named_navigation.dart';
import 'package:routing_navigation/data_transfer_ongenerateroute.dart';
import 'package:routing_navigation/data_transfer_to_previous_screen/data_transfer_to_previous_screen.dart';
import 'package:routing_navigation/named_navigation.dart';
import 'package:routing_navigation/simple_data_transfer_across_screen.dart';

void main() {
  runApp(
    // Простая навигация
    //сonst SimpleNavigation(),

    // Навигация по имени
    //const NamedNavigation(),

    // Простая передача данных между экранами (через конструктор)
    //const SimpleDataTransferAcrossTheScreen(),

    // Передача данных при навигации по имени
//  const DataTransferNamedNavigation(),

    // Передача данных c onGenerateRoute
    //const DataTransferOnGenerateRoute(),

    // Передача данных на предыдущий экран
    const DataTransferToPreviousScreen(),
  );
}
