part of 'database_bloc.dart';

@immutable
abstract class DatabaseEvent {}

class GetList extends DatabaseEvent {
  GetList();
}
