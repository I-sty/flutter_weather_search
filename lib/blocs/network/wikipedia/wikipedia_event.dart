part of 'wikipedia_bloc.dart';

@immutable
abstract class WikipediaEvent {}

class SearchForCity extends WikipediaEvent {
  final String cityName;

  SearchForCity(this.cityName);
}
