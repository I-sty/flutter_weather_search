import 'package:json_annotation/json_annotation.dart';

part 'weather_sys.g.dart';

@JsonSerializable()
class WeatherSys {
  WeatherSys(this.type, this.id, this.message, this.country, this.sunrise,
      this.sunset);

  int type;
  int id;
  @JsonKey(defaultValue: "")
  String message;
  String country;
  int sunrise;
  int sunset;

  factory WeatherSys.fromJson(Map<String, dynamic> json) =>
      _$WeatherSysFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherSysToJson(this);
}
