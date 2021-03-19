import 'package:flutter_app/data/database/database.dart';
import 'package:flutter_app/data/model/weather.dart';

abstract class DatabaseRepository {
  Future<List<WeatherItem>> fetchWeather();
}

class DatabaseRepositoryImpl implements DatabaseRepository {
  late MyDatabase _db;

  DatabaseRepositoryImpl() {
    _db = MyDatabase();
  }

  @override
  Future<List<WeatherItem>> fetchWeather() async {
    return await _db.weatherHistory();
  }
}
