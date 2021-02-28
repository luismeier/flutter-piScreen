import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: SafeArea(
        child: Column(children: <Widget>[
          Text("Update Interval Trains"),
          Text("Update Interval Weather"),
          Text("Station"),
          Text("Trains?"),
          Text("Buses?"),
          Text("Trams?"),
          Text("Weather location"),
          Text("Weather language"),
          Text("Weather api key")
        ]),
      ),
    );
  }
}
