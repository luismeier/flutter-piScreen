import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:piScreen/models/weather_model.dart';

class Weather extends StatelessWidget {
  final WeatherData weather;

  Weather({Key key, @required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(weather.name),
        Text(weather.main, style: new TextStyle(fontSize: 32.0)),
        Text('${weather.temp.toString()}°C'),
        Image.network('https://openweathermap.org/img/w/${weather.icon}.png'),
        Text(new DateFormat('dd.MM').format(weather.date)),
      ],
    );
  }
}
