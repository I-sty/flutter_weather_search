import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/database/database_bloc.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/usecases/database_repository_impl.dart';
import 'package:flutter_app/usecases/weather_repository_impl.dart';
import 'package:flutter_app/usecases/wikipedia_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/network/weather/weather_bloc.dart';
import 'blocs/network/wikipedia/wikipedia_bloc.dart';

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
        BlocProvider<WikipediaBloc>(
          create: (context) => WikipediaBloc(
            WikipediaRepositoryImpl(),
          ),
        ),
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
