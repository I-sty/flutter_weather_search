import 'package:json_annotation/json_annotation.dart';

part 'wikipedia_search_result_query_search_info.g.dart';

@JsonSerializable()
class WikipediaSearchResultQuerySearchInfo {
  int totalhits;

  WikipediaSearchResultQuerySearchInfo(this.totalhits);

  factory WikipediaSearchResultQuerySearchInfo.fromJson(
          Map<String, dynamic> json) =>
      _$WikipediaSearchResultQuerySearchInfoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WikipediaSearchResultQuerySearchInfoToJson(this);
}
