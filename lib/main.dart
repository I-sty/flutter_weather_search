import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/database_bloc.dart';
import 'package:flutter_app/bloc/weather_bloc.dart';
import 'package:flutter_app/data/weather_repository.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/database_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: MultiBlocProvider(
        providers: [
          BlocProvider<WeatherBloc>(
              create: (context) => WeatherBloc(WeatherRepositoryImpl())),
          BlocProvider<DatabaseBloc>(
              create: (context) => DatabaseBloc(DatabaseRepositoryImpl())),
        ],
        child: HomePage(),
      ),
    );
  }
}
