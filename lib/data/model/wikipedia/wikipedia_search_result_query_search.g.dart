// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wikipedia_search_result_query_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WikipediaSearchResultQuerySearch _$WikipediaSearchResultQuerySearchFromJson(
    Map<String, dynamic> json) {
  return WikipediaSearchResultQuerySearch(
    json['ns'] as int,
    json['title'] as String,
    json['pageid'] as int,
    json['size'] as int,
    json['wordcount'] as int,
    json['snippet'] as String,
    json['timestamp'] as String,
  );
}

Map<String, dynamic> _$WikipediaSearchResultQuerySearchToJson(
        WikipediaSearchResultQuerySearch instance) =>
    <String, dynamic>{
      'ns': instance.ns,
      'title': instance.title,
      'pageid': instance.pageId,
      'size': instance.size,
      'wordcount': instance.wordCount,
      'snippet': instance.snippet,
      'timestamp': instance.timestamp,
    };
