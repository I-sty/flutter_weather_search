import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/weather_bloc.dart';
import 'package:flutter_app/data/model/weather.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '_QRViewExampleState.dart';

class WeatherSearchPage extends StatefulWidget {
  @override
  _WeatherSearchPageState createState() => _WeatherSearchPageState();
}

class _WeatherSearchPageState extends State<WeatherSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Search"),
      ),
      body: Container(
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
      ),
    );
  }

  Widget _getPageContent(BuildContext context, WeatherState state) {
    if (state is WeatherInitial) {
      return buildInitialInput();
    } else if (state is WeatherLoading) {
      return buildLoading();
    } else if (state is WeatherLoaded) {
      return buildColumnWithData(state.weather);
    } else {
      // (state is WeatherError)
      return buildInitialInput();
    }
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

  Column buildColumnWithData(Weather weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          "${weather.cityName}, ${weather.system?.country}",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          // Display the temperature with 1 decimal place
          "${weather.main?.temp?.toStringAsFixed(1)} °C",
          style: TextStyle(fontSize: 80),
        ),
        CityInputField(),
      ],
    );
  }

  void openQRCodePage(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QRViewExample()),
    );
    context.read<WeatherBloc>().add(GetWeather(result));
  }
}

class CityInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (value) => submitCityName(context, value),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a city",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  void submitCityName(BuildContext context, String cityName) {
    context.read<WeatherBloc>().add(GetWeather(cityName));
  }
}
