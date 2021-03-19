import 'package:json_annotation/json_annotation.dart';

part 'weather_main.g.dart';

@JsonSerializable()
class WeatherMain {
  double temp = 0;

  @JsonKey(name: 'feels_like')
  double feelsLike = 0;

  @JsonKey(name: 'temp_min')
  double tempMin = 0;

  @JsonKey(name: 'temp_max')
  double tempMax = 0;

  int pressure = 0;

  int humidity = 0;

  WeatherMain(this.temp, this.feelsLike, this.tempMin, this.tempMax,
      this.pressure, this.humidity);

  factory WeatherMain.fromJson(Map<String, dynamic> json) =>
      _$WeatherMainFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherMainToJson(this);
}
