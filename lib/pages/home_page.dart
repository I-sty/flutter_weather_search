import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/network/weather/weather_bloc.dart';
import 'package:flutter_app/pages/history_page.dart';
import 'package:flutter_app/pages/search_page.dart';
import 'package:flutter_app/pages/settings_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [SearchPage(), HistoryPage()];

  @override
  Widget build(BuildContext context) {
    String _appName = "Weather Search";

    return Scaffold(
      appBar: AppBar(
        title: Text(_appName),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => _navigateTo(index),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Center(
                  child: Text(
                _appName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70),
              )),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.https),
              title: Text(
                'dummy list item #1',
                style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    decorationThickness: 1.5,
                    color: Colors.black54),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.https),
              title: Text(
                'dummy list item #2',
                style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    decorationThickness: 1.5,
                    color: Colors.black54),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: _children[_currentIndex],
    );
  }

  _navigateTo(index) {
    _resetWeatherBloc();
    _changeIndex(index);
  }

  void _changeIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _resetWeatherBloc() {
    BlocProvider.of<WeatherBloc>(context).add(ResetWeather());
  }
}
