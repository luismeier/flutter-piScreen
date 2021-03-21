import 'package:flutter/material.dart';
import 'package:piScreen/ui/stationSelect_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SharedPreferences prefs;
  int _timetableInterval;
  bool _showTrains = true;
  bool _showBuses = true;
  bool _showTrams = true;

  _SettingsScreenState() {
    fetch();
  }
  Future<void> fetch() async {
    prefs = await SharedPreferences.getInstance();
    _timetableInterval = prefs.getInt(timeTableIntervalKey);
    _showTrains = prefs.getBool(showTrainsKey) ?? true;
    _showBuses = prefs.getBool(showBusesKey) ?? true;
    _showTrams = prefs.getBool(showTramsKey) ?? true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: SafeArea(
        child: ListView(children: <Widget>[
          ListTile(
              title: Text("Station"),
              subtitle: Text("Select depart station"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StationSelect(),
                    ));
              }),
          ListTile(
            title: Text("Timetable interval"),
            subtitle: Text("The interval in which the timetable gets updated"),
            trailing: DropdownButton<int>(
              focusColor: Colors.white,
              value: _timetableInterval,
              iconEnabledColor: Colors.black,
              items: <int>[
                30,
                60,
                90,
                120,
              ].map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(
                    value.toString() + " seconds",
                  ),
                );
              }).toList(),
              hint: Text(
                "Please select interval",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              onChanged: (int value) {
                setState(() {
                  _timetableInterval = value;
                  prefs.setInt('counter', _timetableInterval);
                });
              },
            ),
          ),
          ListTile(
            title: Text("Trains"),
            subtitle: Text("Choose if timetable should show trains"),
            trailing: Switch(
              value: _showTrains,
              onChanged: (value) {
                setState(() {
                  _showTrains = value;
                  prefs.setBool('showTrains', value);
                });
              },
            ),
          ),
          ListTile(
            title: Text("Buses"),
            subtitle: Text("Choose if timetable should show buses"),
            trailing: Switch(
              value: _showBuses,
              onChanged: (value) {
                setState(() {
                  _showBuses = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text("Trams"),
            subtitle: Text("Choose if timetable should show trams"),
            trailing: Switch(
              value: _showTrams,
              onChanged: (value) {
                setState(() {
                  _showTrams = value;
                });
              },
            ),
          ),
        ]),
      ),
    );
  }
}

// Text("Update Interval Weather"),
// Text("Station"),

// Text("Weather location"),
// Text("Weather language"),
// Text("Weather api key")
