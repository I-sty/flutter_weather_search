import 'package:flutter_app/data/model/weather/weather.dart';

abstract class DatabaseRepository {
  Future<List<WeatherItem>> getDatabaseContent();

  void insertNewItem(WeatherItem item);
}
