import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../data/station.dart';

class TimeTableProvider extends ChangeNotifier {
  Station _station;

  get station => _station;

  TimeTableProvider() {
    _fetchStation();
    Timer.periodic(Duration(seconds: 30), (Timer t) => _fetchStation());
  }

  void _fetchStation() async {
    print("Calling server");
    final response = await http.get(
        'https://fahrplan.search.ch/api/stationboard.json?stop=8503020&show_trackchanges=true&show_delays=true&mode=depart&show_tracks=true&limit=30');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      this._station = Station.fromJson(jsonDecode(response.body));
      notifyListeners();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.

      throw Exception(
          'Failed to load!\n ${response.statusCode} - ${response.body}');
    }
  }
}
