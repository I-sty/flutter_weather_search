class WeatherItem {
  int id = 0;
  final String cityName;
  final double temp;
  final String country;
  final DateTime date;
  final String unit;

  WeatherItem(
      {required this.id,
      required this.cityName,
      required this.temp,
      required this.country,
      required this.date,
      required this.unit});

  Map<String, Object?> toMap() {
    return {
      'city': cityName,
      'temp': temp,
      'country': country,
      'date': date.millisecondsSinceEpoch,
      'unit': unit
    };
  }
}
