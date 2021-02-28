import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:piScreen/models/forecast_model.dart';
import 'package:piScreen/models/weather_model.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class WeatherProvider extends ChangeNotifier {
  bool isLoading = false;
  WeatherData weatherData;
  ForecastData forecastData;

  String city = "Zuerich";
  String units = "metric";
  String apiKey = "0721392c0ba0af8c410aa9394defa29e";
  String url = "https://api.openweathermap.org/data/2.5/";
  String language = "de";
  int forecastLength = 7;

  void update() {
    _loadWeather();
  }

  WeatherProvider() {
    _loadWeather();
    Timer.periodic(Duration(minutes: 20), (Timer t) => _loadWeather());
  }

  void _loadWeather() async {
    print("Loading Weather");
    isLoading = true;
    notifyListeners();

    final weatherResponse = await http
        .get('$url/weather?APPID=$apiKey&q=$city&units=$units&lang=$language');
    final forecastResponse = await http.get(
        '$url/forecast/daily?q=$city&units=$units&cnt=$forecastLength&appid=$apiKey&lang=$language');

    if (weatherResponse.statusCode == 200)
      weatherData = new WeatherData.fromJson(jsonDecode(weatherResponse.body));
    if (forecastResponse.statusCode == 200)
      forecastData =
          new ForecastData.fromJson(jsonDecode(forecastResponse.body));

    isLoading = false;
    notifyListeners();
  }
}
