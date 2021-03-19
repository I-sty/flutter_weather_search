// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherMain _$WeatherMainFromJson(Map<String, dynamic> json) {
  return WeatherMain(
    (json['temp'] as num).toDouble(),
    (json['feels_like'] as num).toDouble(),
    (json['temp_min'] as num).toDouble(),
    (json['temp_max'] as num).toDouble(),
    json['pressure'] as int,
    json['humidity'] as int,
  );
}

Map<String, dynamic> _$WeatherMainToJson(WeatherMain instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
