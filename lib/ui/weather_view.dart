import 'package:flutter/material.dart';
import 'package:piScreen/models/forecast_model.dart';
import 'package:piScreen/providers/weather_provider.dart';
import 'package:piScreen/ui/widgets/weather_item.dart';
import 'package:provider/provider.dart';

import 'widgets/Weather.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);
    return Center(
      child: Column(children: <Widget>[
        Expanded(
          child: provider.isLoading
              ? CircularProgressIndicator(
                  strokeWidth: 2.0,
                  valueColor: new AlwaysStoppedAnimation(Colors.white),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: provider.weatherData != null
                          ? Weather(weather: provider.weatherData)
                          : Container(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 200.0,
                          child: provider.forecastData != null
                              ? ListView.builder(
                                  itemCount: provider.forecastData.list.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => WeatherItem(
                                      weather: provider.forecastData.list
                                          .elementAt(index)),
                                )
                              : Container()),
                    )
                  ],
                ),
        ),
      ]),
    );
  }
}
