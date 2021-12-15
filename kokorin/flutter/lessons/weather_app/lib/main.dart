import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Weather',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
          iconTheme: IconThemeData(color: Colors.black54),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
              ),
            ),
          ],
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(children: [
      _headerImage(),
      SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _weatherDescription(),
              Divider(
                thickness: 1,
                color: Colors.grey[300],
              ),
              _temperature(),
              _temperatureForecast(),
              Divider(
                thickness: 1,
                color: Colors.grey[300],
              ),
              _footerRatings(),
            ],
          ),
        ),
      )
    ]),
  );
}

Image _headerImage() {
  return Image(
    image: NetworkImage(
      'https://images.pexels.com/photos/5007016/pexels-photo-5007016.jpeg',
    ),
    fit: BoxFit.cover,
  );
}

Column _weatherDescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Thusday - May, 22',
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
      Divider(
        thickness: 1,
        color: Colors.grey[300],
      ),
      Text(
        'Consequat veniam adipisicing Lorem laborum nostrud qui deserunt mollit deserunt officia sint excepteur ea. Lorem exercitation est ullamco veniam ea laboris nostrud in sint amet.',
        style: TextStyle(
          color: Colors.black54,
        ),
      ),
    ],
  );
}

Row _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.wb_sunny,
            color: Colors.yellow,
            size: 40,
          ),
        ],
      ),
      SizedBox(
        width: 16.0,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '15\u2103 Clear',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Russia, Moscow',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(
    spacing: 16.0,
    children: List.generate(8, (int index) {
      return Chip(
        label: Text(
          '${index + 20}\u00B0',
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
        avatar: Icon(
          Icons.wb_cloudy,
          color: Colors.blue,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            4,
          ),
          side: BorderSide(
            color: Colors.grey,
          ),
        ),
        backgroundColor: Colors.grey.shade100,
      );
    }),
  );
}

Row _footerRatings() {
  var stars = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Icon(Icons.star, size: 15.0, color: Colors.yellow[500]),
      Icon(Icons.star, size: 15.0, color: Colors.yellow[500]),
      Icon(Icons.star, size: 15.0, color: Colors.yellow[500]),
      Icon(Icons.star, size: 15.0, color: Colors.black),
      Icon(Icons.star, size: 15.0, color: Colors.black),
    ],
  );
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        'Info with Openweathermap.org',
        style: TextStyle(
          fontSize: 15.0,
        ),
      ),
      stars,
    ],
  );
}
