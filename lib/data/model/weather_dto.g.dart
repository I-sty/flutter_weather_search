// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDTO _$WeatherDTOFromJson(Map<String, dynamic> json) {
  return WeatherDTO(
    json['name'] as String,
    WeatherMain.fromJson(json['main'] as Map<String, dynamic>),
    WeatherSys.fromJson(json['sys'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WeatherDTOToJson(WeatherDTO instance) =>
    <String, dynamic>{
      'name': instance.cityName,
      'main': instance.main,
      'sys': instance.system,
    };
