import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) async {
  var file = File('file.txt');
  file.writeAsStringSync('Bonjur epta');
  print(file.readAsStringSync());

  file.writeAsStringSync('\nМеня кинули', mode: FileMode.append);
  print(file.readAsStringSync());

  var myList = <String>[
    'дата рождения: 05.01.1984\n',
    'место рождения: РБ\n',
    'Здарова'
  ];

  myList.forEach((element) {
    file.writeAsStringSync(element, mode: FileMode.append);
  });

  Stream<String> lines =
      file.openRead().transform(utf8.decoder).transform(LineSplitter());
  try {
    await for (var line in lines) {
      print(line);
    }
  } catch (e) {
    print('err');
  }
}
