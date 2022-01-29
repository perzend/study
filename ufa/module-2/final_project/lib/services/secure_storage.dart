import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
 final FlutterSecureStorage _storage = const FlutterSecureStorage();


  // Читаем данные из хранилища по ключу
  Future<String?> readSecureData(String key) async {
    var readData = await _storage.read(key: key);
    return readData;
  }

  // Читаем все данные из хранилища
  Future<Map<String, String>> readAll() async {
    return await _storage.readAll();
  }

  // Пишем данные в хранилище по ключу
  Future<void> writeSecureData(String key, String value) async {

    await _storage.write(key: key, value: value);
  }

  // Удаляем данные из хранилища по ключу
  Future<void> deleteSecureData(String key) async {
    await _storage.delete(key: key);
  }

  // Удаляем все данные из хранилища
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}


