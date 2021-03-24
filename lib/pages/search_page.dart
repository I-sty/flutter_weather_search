import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/database/database_bloc.dart';
import 'package:flutter_app/blocs/network/weather_bloc.dart';
import 'package:flutter_app/data/model/weather.dart';
import 'package:flutter_app/data/model/weather_dto.dart';
import 'package:flutter_app/widgets/CityInputField.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'qr_code_page.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      alignment: Alignment.center,
      child: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is WeatherError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: _getPageContent(context, state),
                ),
                Expanded(
                  flex: 2,
                  child: TextButton.icon(
                    icon: Icon(Icons.qr_code),
                    label: Text("Scan city using QR code"),
                    onPressed: () {
                      openQRCodePage(context);
                    },
                  ),
                )
              ]);
        },
      ),
    );
  }

  Widget _getPageContent(BuildContext context, WeatherState state) {
    if (state is WeatherInitial) {
      return buildInitialInput();
    } else if (state is WeatherLoading) {
      return buildLoading();
    } else if (state is WeatherLoaded) {
      var weatherItem = convertWeather(state.weather);
      BlocProvider.of<DatabaseBloc>(context).add(Insert(weatherItem));
      return buildColumnWithData(weatherItem);
    } else {
      // (state is WeatherError)
      return buildInitialInput();
    }
  }

  void openQRCodePage(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    String? result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QRViewExample()),
    );
    context.read<WeatherBloc>().add(GetWeather(result));
  }

  Widget buildInitialInput() {
    return Center(
      child: CityInputField(),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Column buildColumnWithData(WeatherItem weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          "${weather.cityName}, ${weather.country}",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          // Display the temperature with 1 decimal place
          "${weather.temp.toStringAsFixed(1)} °C",
          style: TextStyle(fontSize: 80),
        ),
        CityInputField(),
      ],
    );
  }
}

WeatherItem convertWeather(WeatherDTO weather) {
  return WeatherItem(
      id: 0,
      cityName: weather.cityName,
      temp: weather.main.temp,
      country: weather.system.country,
      date: DateTime.now());
}
