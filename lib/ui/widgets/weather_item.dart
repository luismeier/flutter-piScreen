import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:piScreen/models/weather_model.dart';

class WeatherItem extends StatelessWidget {
  final WeatherData weather;

  WeatherItem({Key key, @required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(new DateFormat('dd.MM').format(weather.date)),
            Text(weather.main),
            // Text('${weather.temp.toString()}°C'),
            Text(
                "min: ${weather.temp_min.toString()}°C, max: ${weather.temp_max.toString()}°C"),
            Image.network(
                'https://openweathermap.org/img/w/${weather.icon}.png'),
          ],
        ),
      ),
    );
  }
}
