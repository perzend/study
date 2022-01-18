import 'dart:io';
import 'package:path_provider/path_provider.dart';

// Класс описывает методы для хранения данных в файле
class CounterStorage {

  // Получение пути к каталогу, где лежит файл
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // Создание файла
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  // Удаление файла
  Future<int> deleteFile() async {
    try {
      final file = await _localFile;
      await file.delete();
      return -1;
    } catch (e) {
      return 0;
    }
  }

  // Чтение данных из файла
  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  // Запись данных в файл
  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }
}
