import 'package:flutter_app/data/model/weather_main.dart';
import 'package:flutter_app/data/model/weather_sys.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_dto.g.dart';

@JsonSerializable()
class WeatherDTO {
  WeatherDTO(this.cityName, this.main, this.system);

  @JsonKey(name: 'name')
  String cityName;

  WeatherMain main;

  @JsonKey(name: 'sys')
  WeatherSys system;

  factory WeatherDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherDTOFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDTOToJson(this);
}
