import 'package:flutter_app/data/database/database.dart';
import 'package:flutter_app/data/model/weather.dart';
import 'package:flutter_app/repositories/database_repository.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  late MyDatabase _db;

  DatabaseRepositoryImpl() {
    _db = MyDatabase();
  }

  @override
  Future<List<WeatherItem>> getDatabaseContent() async {
    return await _db.weatherHistory();
  }

  @override
  void insertNewItem(WeatherItem item) async {
    _db.insert(item);
  }
}
