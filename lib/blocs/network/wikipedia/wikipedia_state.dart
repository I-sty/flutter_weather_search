part of 'wikipedia_bloc.dart';

@immutable
abstract class WikipediaState {
  const WikipediaState();
}

class Init extends WikipediaState {
  const Init();
}

class Loading extends WikipediaState {
  const Loading();
}

class Loaded extends WikipediaState {
  final WikipediaSearchResultDTO result;

  const Loaded(this.result);
}

class Error extends WikipediaState {
  final String message;

  const Error(this.message);
}
