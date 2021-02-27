import 'package:flutter/material.dart';
import 'package:piScreen/providers/timetable_provider.dart';
import 'package:piScreen/providers/weather_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'piScreenApp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Enable full screen
  SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<TimeTableProvider>(
        create: (context) => TimeTableProvider()),
    ChangeNotifierProvider<WeatherProvider>(
        create: (context) => WeatherProvider()),
  ], child: PiScreenApp()));
}
