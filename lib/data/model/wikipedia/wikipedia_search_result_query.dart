import 'package:flutter_app/data/model/wikipedia/wikipedia_search_result_query_search.dart';
import 'package:flutter_app/data/model/wikipedia/wikipedia_search_result_query_search_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wikipedia_search_result_query.g.dart';

@JsonSerializable()
class WikipediaSearchResultQuery {
  WikipediaSearchResultQuery(this.searchInfo, this.search);

  @JsonKey(name: 'searchinfo')
  WikipediaSearchResultQuerySearchInfo searchInfo;

  List<WikipediaSearchResultQuerySearch> search;

  factory WikipediaSearchResultQuery.fromJson(Map<String, dynamic> json) =>
      _$WikipediaSearchResultQueryFromJson(json);

  Map<String, dynamic> toJson() => _$WikipediaSearchResultQueryToJson(this);
}
