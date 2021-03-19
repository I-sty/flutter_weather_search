part of 'database_bloc.dart';

@immutable
abstract class DatabaseState {
  const DatabaseState();
}

class DatabaseInitial extends DatabaseState {
  const DatabaseInitial();
}

class DatabaseLoading extends DatabaseState {
  const DatabaseLoading();
}

class DatabaseLoaded extends DatabaseState {
  final List<WeatherItem> list;

  const DatabaseLoaded(this.list);
}

class DatabaseError extends DatabaseState {
  const DatabaseError();
}
