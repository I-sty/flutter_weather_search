import 'package:json_annotation/json_annotation.dart';

part 'wikipedia_search_result_query_search.g.dart';

@JsonSerializable()
class WikipediaSearchResultQuerySearch {
  WikipediaSearchResultQuerySearch(this.ns, this.title, this.pageId, this.size,
      this.wordCount, this.snippet, this.timestamp);

  int ns = 0;
  String title;
  @JsonKey(name: 'pageid')
  int pageId;
  int size;
  @JsonKey(name: 'wordcount')
  int wordCount;
  String snippet;
  String timestamp;

  factory WikipediaSearchResultQuerySearch.fromJson(
          Map<String, dynamic> json) =>
      _$WikipediaSearchResultQuerySearchFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WikipediaSearchResultQuerySearchToJson(this);
}
