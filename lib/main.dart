import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/database/database_bloc.dart';
import 'package:flutter_app/blocs/network/weather_bloc.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/usecases/database_repository_impl.dart';
import 'package:flutter_app/usecases/weather_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(
            WeatherRepositoryImpl(),
          ),
        ),
        BlocProvider<DatabaseBloc>(
          create: (context) => DatabaseBloc(
            DatabaseRepositoryImpl(),
          ),
        ),
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
