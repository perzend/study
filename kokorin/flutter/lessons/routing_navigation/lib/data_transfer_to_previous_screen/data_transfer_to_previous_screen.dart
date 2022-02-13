import 'package:flutter/material.dart';
import 'package:routing_navigation/data_transfer_to_previous_screen/first_page.dart';

class DataTransferToPreviousScreen extends StatelessWidget {
  const DataTransferToPreviousScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstPage(),
    );
  }
}
