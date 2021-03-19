import 'package:bloc/bloc.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/data/model/weather_dto.dart';
import 'package:flutter_app/data/weather_repository.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(WeatherInitial());

  Future<void> getWeather(String cityName, OWUnits units) async {
    try {
      emit(WeatherLoading());
      final weather = await _weatherRepository.fetchWeather(cityName, units);
      emit(WeatherLoaded(weather));
    } on NetworkException {
      emit(WeatherError("Couldn't fetch weather. Is the device online?"));
    }
  }
}