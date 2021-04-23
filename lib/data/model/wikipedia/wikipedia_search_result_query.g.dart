// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wikipedia_search_result_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WikipediaSearchResultQuery _$WikipediaSearchResultQueryFromJson(
    Map<String, dynamic> json) {
  return WikipediaSearchResultQuery(
    WikipediaSearchResultQuerySearchInfo.fromJson(
        json['searchinfo'] as Map<String, dynamic>),
    (json['search'] as List<dynamic>)
        .map((e) => WikipediaSearchResultQuerySearch.fromJson(
            e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$WikipediaSearchResultQueryToJson(
        WikipediaSearchResultQuery instance) =>
    <String, dynamic>{
      'searchinfo': instance.searchInfo,
      'search': instance.search,
    };
