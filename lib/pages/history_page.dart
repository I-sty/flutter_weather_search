import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/database/database_bloc.dart';
import 'package:flutter_app/data/model/weather/weather.dart';
import 'package:flutter_app/pages/history_item_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _get(context);

    return RefreshIndicator(
        child: Container(
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
        ),
        onRefresh: _onRefresh);
  }

  Widget _getPageContent(BuildContext context, DatabaseState state) {
    if (state is DatabaseInitial) {
      return buildLoading();
    } else if (state is DatabaseLoading) {
      return buildLoading();
    } else if (state is DatabaseLoaded) {
      return getWeatherItems(state.list.reversed.toList());
    } else {
      // (state is WeatherError)
      return buildLoading();
    }
  }

  Widget buildLoading() {
    return Center(child: CircularProgressIndicator());
  }

  Widget getWeatherItems(List<WeatherItem> result) {
    if (result.isEmpty) {
      return Text(
        "No data",
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black38),
      );
    }
    return Scrollbar(
      child: ListView.builder(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        itemCount: result.length,
        itemBuilder: (context, index) => weatherItems(context, result[index]),
      ),
    );
  }

  Widget weatherItems(BuildContext context, WeatherItem item) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(top: 16),
      child: ListTile(
        title: Text("${item.cityName}, ${item.country}"),
        subtitle: Text("${item.temp}"),
        isThreeLine: false,
        leading: Icon(Icons.thermostat_rounded),
        onTap: () => _openItemPage(context, item),
      ),
    );
  }

  void _get(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 500), () {
      context.read<DatabaseBloc>().add(GetList());
    });
  }

  Future<Null> _onRefresh() async {
    // BlocProvider.of<DatabaseBloc>(context).add(GetList());
    // final item = BlocProvider.of<DatabaseBloc>(context).add(GetList());
    // return item.firstWhere((e) => e is ! GetList);
  }

  _openItemPage(BuildContext context, WeatherItem item) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HistoryItemPage(item: item)),
    );
  }
}
