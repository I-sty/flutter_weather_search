import 'package:flutter_app/constants.dart';

import '../data/model/weather_dto.dart';

abstract class WeatherRepository {
  /// Throws [NetworkException], [CityNotFoundException].
  Future<WeatherDTO> fetchWeather(String cityName, OWUnits metric);
}

class NetworkException implements Exception {}

class CityNotFoundException implements Exception {
  String cityName = "";

  CityNotFoundException(String cityName) {
    this.cityName = cityName;
  }
}
