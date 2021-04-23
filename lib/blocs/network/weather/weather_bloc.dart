import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/data/model/weather/weather_dto.dart';
import 'package:flutter_app/repositories/exceptions/city_not_found_exception.dart';
import 'package:flutter_app/repositories/exceptions/network_exception.dart';
import 'package:flutter_app/repositories/weather_repository.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is GetWeather) {
      try {
        yield WeatherLoading();
        if (event.cityName == null ||
            event.cityName!.isEmpty ||
            _isNumeric(event.cityName)) {
          yield WeatherError("Unknown city name.");
          return;
        }
        final weather =
            await _weatherRepository.fetchWeather(event.cityName!, event.unit);
        yield WeatherLoaded(weather, event.unit);
      } on NetworkException {
        yield WeatherError("Couldn't fetch weather.");
      } on CityNotFoundException catch (e) {
        yield WeatherError("Unknown city name: ${e.cityName}");
      }
    } else if (event is ResetWeather) {
      yield WeatherInitial();
    }
  }

  bool _isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}
