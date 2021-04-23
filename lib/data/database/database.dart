import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_app/data/model/weather/weather.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase {
  late Future<Database> _database;

  MyDatabase() {
    _openDb();
  }

  void _openDb() async {
    // Avoid errors caused by flutter upgrade.
    // Importing 'package:flutter/widgets.dart' is required.
    WidgetsFlutterBinding.ensureInitialized();
    // Open the database and store the reference.
    _database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'database.db'),
      // When the database is first created, create a table to store weather items.
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE weather(id INTEGER PRIMARY KEY, temp DOUBLE, city TEXT, country TEXT, date INTEGER, unit TEXT)",
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  Future<int> insert(WeatherItem weather) async {
    // Get a reference to the database.
    final Database db = await _database;

    // Insert the weather into the correct table. Also specify the
    // `conflictAlgorithm`.
    return await db.insert(
      'weather',
      weather.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the weather from the weather table.
  Future<List<WeatherItem>> weatherHistory() async {
    // Get a reference to the database.
    final Database db = await _database;

    final List<Map<String, dynamic>> maps = await db.query('weather');

    // Convert the List<Map<String, dynamic> into a List<WeatherItem>.
    return List.generate(maps.length, (i) {
      return WeatherItem(
          id: maps[i]['id'],
          cityName: maps[i]['city'],
          temp: maps[i]['temp'],
          country: maps[i]['country'],
          date: DateTime.fromMillisecondsSinceEpoch(maps[i]['date']),
          unit: maps[i]['unit']);
    });
  }

  Future<void> deleteWeather(int id) async {
    // Get a reference to the database.
    final db = await _database;

    await db.delete(
      'weather',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
