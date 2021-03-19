// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_sys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherSys _$WeatherSysFromJson(Map<String, dynamic> json) {
  return WeatherSys(
    json['type'] as int,
    json['id'] as int,
    json['message'] as String? ?? '',
    json['country'] as String,
    json['sunrise'] as int,
    json['sunset'] as int,
  );
}

Map<String, dynamic> _$WeatherSysToJson(WeatherSys instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'message': instance.message,
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
