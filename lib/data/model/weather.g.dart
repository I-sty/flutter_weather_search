// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    json['name'] as String,
    json['main'] == null
        ? null
        : WeatherMain.fromJson(json['main'] as Map<String, dynamic>),
    json['sys'] == null
        ? null
        : WeatherSys.fromJson(json['sys'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'name': instance.cityName,
      'main': instance.main,
      'sys': instance.system,
    };
