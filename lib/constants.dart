class OWConstants {
  static const MAP_KEY = "2fc59b280b9dbdd1e52b5c3a02b4ae18";
  static const URL = "api.openweathermap.org";
  static const PATH = "data/2.5/weather";
  static const QUERY = "q";
  static const UNITS = "units";
  static const APP_ID = "appid";
}

enum OWUnits { METRIC, IMPERIAL }

extension ParseToString on OWUnits {
  String toShortString() {
    return this.toString().split('.').last.toLowerCase();
  }
}

class WikipediaConstants {
  static const URL = "en.wikipedia.org";
  static const PATH = "w/api.php";
  static const ACTION = "action";
  static const QUERY = "query";
  static const LIST = "list";
  static const SEARCH = "search";
  static const SRSEARCH = "srsearch";
  static const FORMAT = "format";
  static const JSON = "json";
  static const UTF8 = "utf8";
  static const ENABLE_1 = "1";
}
