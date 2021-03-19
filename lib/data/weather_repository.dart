import 'dart:convert';
import 'dart:io';

import 'package:flutter_app/constants.dart';
import 'package:http/http.dart' as http;

import 'model/weather.dart';

abstract class WeatherRepository {
  /// Throws [NetworkException], [CityNotFoundException].
  Future<Weather> fetchWeather(String cityName, OWUnits metric);
}

class WeatherRepositoryImpl implements WeatherRepository {
  @override
  Future<Weather> fetchWeather(String cityName, OWUnits metric) async {
    var uri = Uri.https(OWConstants.URL, OWConstants.PATH, {
      OWConstants.QUERY: cityName,
      OWConstants.UNITS: metric.toShortString(),
      OWConstants.APP_ID: OWConstants.MAP_KEY
    });
    var response = await http.get(uri);
    var statusCode = response.statusCode;

    switch (statusCode) {
      case HttpStatus.ok:
        return Weather.fromJson(jsonDecode(response.body));
      case HttpStatus.notFound:
        throw CityNotFoundException(cityName);
      default:
        throw NetworkException();
    }
  }
}

class NetworkException implements Exception {}

class CityNotFoundException implements Exception {
  String cityName = "";

  CityNotFoundException(String cityName) {
    this.cityName = cityName;
  }
}
