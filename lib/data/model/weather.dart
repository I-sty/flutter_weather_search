class WeatherItem {
  int id = 0;
  final String cityName;
  final double temp;
  final String country;
  final DateTime date;

  WeatherItem(
      {required this.id,
      required this.cityName,
      required this.temp,
      required this.country,
      required this.date});

  Map<String, Object?> toMap() {
    return {
      'city': cityName,
      'temp': temp,
      'country': country,
      'date': date.millisecondsSinceEpoch
    };
  }
}
