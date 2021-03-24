part of 'database_bloc.dart';

@immutable
abstract class DatabaseEvent {}

class GetList extends DatabaseEvent {
  GetList();
}

class Insert extends DatabaseEvent {
  final WeatherItem item;

  Insert(this.item);
}
