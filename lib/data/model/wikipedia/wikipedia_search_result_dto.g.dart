// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wikipedia_search_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WikipediaSearchResultDTO _$WikipediaSearchResultDTOFromJson(
    Map<String, dynamic> json) {
  return WikipediaSearchResultDTO(
    WikipediaSearchResultQuery.fromJson(json['query'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WikipediaSearchResultDTOToJson(
        WikipediaSearchResultDTO instance) =>
    <String, dynamic>{
      'query': instance.query,
    };
