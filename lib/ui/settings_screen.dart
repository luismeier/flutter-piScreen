import 'package:flutter/material.dart';
import 'package:piScreen/ui/stationSelect_screen.dart';
import 'package:get_storage/get_storage.dart';

import '../constants.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final box = GetStorage();
  var _stationName;
  int _tableInterval;
  bool _showTrains;
  bool _showBusses;
  bool _showTrams;

  _SettingsScreenState() {
    _stationName = box.read(stationNameKey) ?? "Please select a station";
    _tableInterval = box.read(timeTableIntervalKey) ?? 30;
    _showTrains = box.read(showTrainsKey) ?? true;
    _showBusses = box.read(showBusesKey) ?? false;
    _showTrams = box.read(showTramsKey) ?? true;
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
            trailing: Text(_stationName),
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StationSelect(),
                ),
              );
              setState(() {
                _stationName = box.read(stationNameKey);
              });
            },
          ),
          ListTile(
            title: Text("Timetable interval"),
            subtitle: Text("The interval in which the timetable gets updated"),
            trailing: DropdownButton<int>(
              focusColor: Colors.white,
              value: _tableInterval,
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
                  box.write(timeTableIntervalKey, value);
                  _tableInterval = value;
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
                  box.write(showTrainsKey, value);
                  _showTrains = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text("Buses"),
            subtitle: Text("Choose if timetable should show buses"),
            trailing: Switch(
              value: _showBusses,
              onChanged: (value) {
                setState(() {
                  box.write(showBusesKey, value);
                  _showBusses = value;
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
                  box.write(showTramsKey, value);
                  _showTrams = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text("Erase settings"),
            trailing: IconButton(
              icon: new Icon(Icons.delete),
              onPressed: () {
                box.erase();
                print("Deleted the Settings");
              },
            ),
          )
        ]),
      ),
    );
  }
}
