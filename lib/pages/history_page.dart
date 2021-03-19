import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/database_bloc.dart';
import 'package:flutter_app/data/model/weather.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _get(context);

    return Container(
      alignment: Alignment.center,
      child: BlocConsumer<DatabaseBloc, DatabaseState>(
        listener: (context, state) {
          if (state is DatabaseError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Db error"),
              ),
            );
          }
        },
        builder: (context, state) {
          return _getPageContent(context, state);
        },
      ),
    );
  }

  Widget _getPageContent(BuildContext context, DatabaseState state) {
    if (state is DatabaseInitial) {
      return buildLoading();
    } else if (state is DatabaseLoading) {
      return buildLoading();
    } else if (state is DatabaseLoaded) {
      return getWeatherItems(state.list);
    } else {
      // (state is WeatherError)
      return buildLoading();
    }
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  ListView getWeatherItems(List<WeatherItem> result) {
    return ListView(
      children: weatherItems(result),
    );
  }

  List<ListTile> weatherItems(List<WeatherItem> result) {
    List<ListTile> list = List<ListTile>.empty(growable: true);
    for (WeatherItem item in result) {
      list.add(ListTile(
        title: Text("${item.cityName}, ${item.country}"),
        subtitle: Text("${item.temp}"),
        isThreeLine: true,
        leading: Icon(Icons.thermostat_rounded),
      ));
    }
    return list;
  }

  void _get(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 500), () {
      context.read<DatabaseBloc>().add(GetList());
    });
  }
}
