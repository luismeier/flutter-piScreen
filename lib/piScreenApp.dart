import 'package:flutter/material.dart';
import 'package:piScreen/ui/home_screen.dart';

class PiScreenApp extends StatelessWidget {
  const PiScreenApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'piScreen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
