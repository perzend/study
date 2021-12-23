import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextDemoScreen extends StatelessWidget {
  const TextDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                margin: const EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  border: Border.all(
                    color: Colors.red,
                    width: 3,
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Просто текстПросто текстПросто текстПросто текстПросто текстПросто текстПросто текстПросто текстПросто текстПросто текстПросто текстПросто текстПросто текстПросто текст',
                  softWrap: false,
                  overflow: TextOverflow.visible,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              Container(
                width: 200,
                height: 200,
                margin: const EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  border: Border.all(
                    color: Colors.red,
                    width: 3,
                  ),
                ),
                alignment: Alignment.center,
                child: const Text.rich(
                  TextSpan(
                    text: 'Фрагмент',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    children: [
                      TextSpan(
                        text: ' стилизованного',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ' текста',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
