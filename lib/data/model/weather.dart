import 'package:flutter_app/data/model/weather_main.dart';
import 'package:flutter_app/data/model/weather_sys.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  Weather(this.cityName, this.main, this.system);

  @JsonKey(name: 'name')
  String cityName;

  WeatherMain? main;

  @JsonKey(name: 'sys')
  WeatherSys? system;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
