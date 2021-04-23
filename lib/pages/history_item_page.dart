import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/network/wikipedia/wikipedia_bloc.dart';
import 'package:flutter_app/data/model/weather/weather.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryItemPage extends StatefulWidget {
  final WeatherItem item;

  HistoryItemPage({Key? key, required this.item}) : super(key: key);

  @override
  _HistoryItemPageState createState() => _HistoryItemPageState();
}

class _HistoryItemPageState extends State<HistoryItemPage> {
  late final Color color;
  late WikipediaBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = BlocProvider.of<WikipediaBloc>(context);
    bloc.add(SearchForCity(widget.item.cityName));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    color = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(title: Text("${widget.item.cityName}")),
      body: ListView(
        children: <Widget>[
          _titleSection(),
          _buttonSection(),
          BlocConsumer<WikipediaBloc, WikipediaState>(
            listener: (context, state) {
              if (state is Error) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              return _textSection(state);
            },
          )
        ],
      ),
    );
  }

  Widget _titleSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    widget.item.cityName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.black),
                  ),
                ),
                Text(
                  widget.item.country,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.thermostat_sharp,
            size: 32,
            color: Colors.red[500],
          ),
          Text(
            "${widget.item.temp.toStringAsFixed(1)}${widget.item.unit}",
            style: TextStyle(fontSize: 32),
          ),
        ],
      ),
    );
  }

  Widget _buttonSection() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Widget _textSection(WikipediaState state) {
    return Container(padding: const EdgeInsets.all(32), child: _result(state));
  }

  Widget _result(WikipediaState state) {
    if (state is Loaded) {
      return Text(
        state.result.query.search.first.snippet,
        softWrap: true,
      );
    } else if ((state is Init) || (state is Loading)) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
        ],
      );
    } else if (state is Error) {
      return Text(state.message,
          style: TextStyle(fontSize: 23, color: Colors.redAccent));
    } else {
      return Text("No data available",
          style: TextStyle(fontSize: 23, color: Colors.redAccent));
    }
  }
}
