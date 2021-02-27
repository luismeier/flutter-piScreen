import 'package:piScreen/models/weather_model.dart';

class ForecastData {
  String city;
  final List list;

  ForecastData(this.list);

  factory ForecastData.fromJson(Map<String, dynamic> json) {
    List list = new List();

    for (dynamic e in json['list']) {
      WeatherData w = new WeatherData(
        new DateTime.fromMillisecondsSinceEpoch(e['dt'] * 1000, isUtc: false),
        json['city']['name'],
        e['temp']['day'].toInt(),
        e['temp']['min'].toInt(),
        e['temp']['max'].toInt(),
        e['weather'][0]['description'],
        e['weather'][0]['icon'],
      );
      list.add(w);
    }

    return ForecastData(list);
  }
}
