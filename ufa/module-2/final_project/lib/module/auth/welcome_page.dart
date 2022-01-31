import 'dart:async';

import 'package:final_project/routes/routes.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  final String? phone;

  const WelcomePage({Key? key, required this.phone}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Timer? _timer;
  int _startTimer = 5;

  @override
  void initState() {
    _timerNextScreen();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _timerNextScreen() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_startTimer == 0) {
          setState(() {
            timer.cancel();
            Navigator.pushReplacementNamed(context, Routes.usersList);
          });
        } else {
          setState(() {
            _startTimer--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/back4.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Final App!\n Your login is:',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                widget.phone!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.deepPurpleAccent, fontSize: 30.0),
              ),
              const SizedBox(
                height: 32.0,
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 50,
                    child: CircularProgressIndicator(
                      value: _startTimer * 0.2,
                      color: Colors.red,
                      backgroundColor: Colors.blue,
                      strokeWidth: 10.0,
                    ),
                  ),
                  Text(
                    '$_startTimer',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              )
            ],
          ),
        ),]
      ),
    );
  }
}
