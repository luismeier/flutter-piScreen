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
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 0.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.,
          children: <Widget>[
            Text(new DateFormat('dd.MM').format(weather.date)),
            Text(weather.main),
            Image.network(
                'https://openweathermap.org/img/w/${weather.icon}.png'),
            Row(
              children: <Widget>[
                Icon(Icons.arrow_downward),
                Text("${weather.tempMin.toString()}°C"),
                SizedBox(width: 5),
                Icon(Icons.arrow_upward),
                Text("${weather.tempMax.toString()}°C"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
