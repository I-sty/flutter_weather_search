// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_sys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherSys _$WeatherSysFromJson(Map<String, dynamic> json) {
  return WeatherSys(
    json['type'] as int? ?? -1,
    json['id'] as int? ?? -1,
    json['message'] as String? ?? '',
    json['country'] as String? ?? '',
    json['sunrise'] as int? ?? -1,
    json['sunset'] as int? ?? -1,
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
