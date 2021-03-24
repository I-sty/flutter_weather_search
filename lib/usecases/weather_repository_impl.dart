import 'dart:convert';
import 'dart:io';

import 'package:flutter_app/constants.dart';
import 'package:flutter_app/data/model/weather_dto.dart';
import 'package:flutter_app/repositories/weather_repository.dart';
import 'package:http/http.dart' as http;

class WeatherRepositoryImpl implements WeatherRepository {
  @override
  Future<WeatherDTO> fetchWeather(String cityName, OWUnits metric) async {
    var uri = Uri.https(OWConstants.URL, OWConstants.PATH, {
      OWConstants.QUERY: cityName,
      OWConstants.UNITS: metric.toShortString(),
      OWConstants.APP_ID: OWConstants.MAP_KEY
    });
    var response = await http.get(uri);
    var statusCode = response.statusCode;

    switch (statusCode) {
      case HttpStatus.ok:
        return WeatherDTO.fromJson(jsonDecode(response.body));
      case HttpStatus.notFound:
        throw CityNotFoundException(cityName);
      default:
        throw NetworkException();
    }
  }
}
