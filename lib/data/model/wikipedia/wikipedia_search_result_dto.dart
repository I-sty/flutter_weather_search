import 'package:flutter_app/data/model/wikipedia/wikipedia_search_result_query.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wikipedia_search_result_dto.g.dart';

@JsonSerializable()
class WikipediaSearchResultDTO {
  WikipediaSearchResultDTO(this.query);

  WikipediaSearchResultQuery query;

  factory WikipediaSearchResultDTO.fromJson(Map<String, dynamic> json) =>
      _$WikipediaSearchResultDTOFromJson(json);

  Map<String, dynamic> toJson() => _$WikipediaSearchResultDTOToJson(this);
}
