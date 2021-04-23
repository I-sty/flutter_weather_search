import 'package:bloc/bloc.dart';
import 'package:flutter_app/data/model/wikipedia/wikipedia_search_result_dto.dart';
import 'package:flutter_app/repositories/exceptions/city_not_found_exception.dart';
import 'package:flutter_app/repositories/exceptions/network_exception.dart';
import 'package:flutter_app/repositories/wikipedia_repository.dart';
import 'package:meta/meta.dart';

part 'wikipedia_event.dart';

part 'wikipedia_state.dart';

class WikipediaBloc extends Bloc<WikipediaEvent, WikipediaState> {
  final WikipediaRepository _wikipediaRepository;

  WikipediaBloc(this._wikipediaRepository) : super(Init());

  @override
  Stream<WikipediaState> mapEventToState(WikipediaEvent event) async* {
    if (event is SearchForCity) {
      yield Loading();
      if (event.cityName.isEmpty) {
        yield Error("Unknown city name!");
        return;
      }
      try {
        final cityArticle =
            await _wikipediaRepository.searchForCity(event.cityName);
        yield Loaded(cityArticle);
      } on NetworkException {
        yield Error("Could not fetch city info!");
      } on CityNotFoundException catch (e) {
        yield Error("Unknown city name: ${e.cityName}");
      } on Exception catch (e) {
        yield Error("Unknown error: ${e.toString()}");
      }
    }
  }
}
