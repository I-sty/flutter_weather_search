class CityNotFoundException implements Exception {
  String cityName = "";

  CityNotFoundException(String cityName) {
    this.cityName = cityName;
  }
}
