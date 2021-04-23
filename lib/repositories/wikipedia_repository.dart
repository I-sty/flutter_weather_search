import 'package:flutter_app/data/model/wikipedia/wikipedia_search_result_dto.dart';

abstract class WikipediaRepository {
  /// Throws [NetworkException], [CityNotFoundException].
  Future<WikipediaSearchResultDTO> searchForCity(String cityName);
}
