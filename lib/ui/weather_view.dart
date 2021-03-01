import 'package:flutter/material.dart';
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
              ? Center(
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(
                      strokeWidth: 4.0,
                      valueColor: new AlwaysStoppedAnimation(Colors.white),
                    ),
                  ),
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
                          height: 135.0,
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
