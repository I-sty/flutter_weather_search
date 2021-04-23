import 'package:flutter_app/constants.dart';
import 'package:flutter_app/data/model/weather/weather_dto.dart';

abstract class WeatherRepository {
  /// Throws [NetworkException], [CityNotFoundException].
  Future<WeatherDTO> fetchWeather(String cityName, OWUnits metric);
}
