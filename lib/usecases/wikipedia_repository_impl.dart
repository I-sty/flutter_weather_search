import 'dart:convert';
import 'dart:io';

import 'package:flutter_app/constants.dart';
import 'package:flutter_app/data/model/wikipedia/wikipedia_search_result_dto.dart';
import 'package:flutter_app/repositories/exceptions/city_not_found_exception.dart';
import 'package:flutter_app/repositories/exceptions/network_exception.dart';
import 'package:flutter_app/repositories/wikipedia_repository.dart';
import 'package:http/http.dart' as http;

class WikipediaRepositoryImpl implements WikipediaRepository {
  @override
  Future<WikipediaSearchResultDTO> searchForCity(String cityName) async {
    var uri = Uri.https(WikipediaConstants.URL, WikipediaConstants.PATH, {
      WikipediaConstants.ACTION: WikipediaConstants.QUERY,
      WikipediaConstants.LIST: WikipediaConstants.SEARCH,
      WikipediaConstants.SRSEARCH: cityName,
      WikipediaConstants.FORMAT: WikipediaConstants.JSON,
      WikipediaConstants.UTF8: WikipediaConstants.ENABLE_1,
    });
    var response = await http.get(uri);
    var statusCode = response.statusCode;

    switch (statusCode) {
      case HttpStatus.ok:
        return WikipediaSearchResultDTO.fromJson(jsonDecode(response.body));
      case HttpStatus.notFound:
        throw CityNotFoundException(cityName);
      default:
        throw NetworkException();
    }
  }
}
