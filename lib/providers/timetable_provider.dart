import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../models/station_model.dart';

import 'package:get_storage/get_storage.dart';

class TimeTableProvider extends ChangeNotifier {
  final box = GetStorage();
  Station _station;
  get station => _station;

  String _errorString = "";
  get errorString => _errorString;

  void update() {
    _fetchStation();
  }

  TimeTableProvider() {
    _fetchStation();
    Timer.periodic(Duration(seconds: 30), (Timer t) => _fetchStation());
  }

  void _fetchStation() async {
    print("Calling timetable API");

    String baseURL = "https://fahrplan.search.ch/api/stationboard.json";
    String stop = box.read(stationKey);

    var url = Uri.parse(
        '$baseURL?stop=$stop&show_trackchanges=true&show_delays=true&mode=depart&show_tracks=true&limit=30');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      if (response.body.contains("messages")) {
        _errorString = "Die Haltestelle \n\"$stop\" \nwurde nicht gefunden";
        return;
      }

      this._station = Station.fromJson(jsonDecode(response.body));
      this._errorString = "";
      notifyListeners();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.

      throw Exception(
          'Failed to load!\n ${response.statusCode} - ${response.body}');
    }
  }
}
