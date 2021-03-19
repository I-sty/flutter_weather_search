import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/data/database_repository.dart';
import 'package:flutter_app/data/model/weather.dart';
import 'package:meta/meta.dart';

part 'database_event.dart';

part 'database_state.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  final DatabaseRepository _dbRepository;

  DatabaseBloc(this._dbRepository) : super(DatabaseInitial());

  @override
  Stream<DatabaseState> mapEventToState(
    DatabaseEvent event,
  ) async* {
    if (event is GetList) {
      yield DatabaseLoading();
      try {
        final List<WeatherItem> weather = await _dbRepository.fetchWeather();
        yield DatabaseLoaded(weather);
      } catch (e) {
        yield DatabaseError();
      }
    }
  }
}
