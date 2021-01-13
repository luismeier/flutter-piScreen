import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:piScreen/data/connection.dart';
import 'package:piScreen/data/station.dart';

import 'package:piScreen/ui/widgets/connection_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Station> futureConnection;
  String _timeString;
  String _datumString;

  @override
  void initState() {
    super.initState();
    _timeString =
        "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    futureConnection = fetchStation();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedTime = _formatTime(now);
    final String formattedDate = _formatDate(now);
    setState(() {
      _timeString = formattedTime;
      _datumString = formattedDate;
    });
  }

  String _formatTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss').format(dateTime);
  }

  String _formatDate(DateTime dateTime) {
    return DateFormat('dd.MM.yyyy').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text(
                _timeString,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                _datumString,
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder<Station>(
            future: futureConnection,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.connections.length,
                  itemBuilder: (context, index) {
                    Connections connection = snapshot.data.connections[index];
                    return new ConnectionWidget(
                      destination: connection.terminal.name,
                      line: connection.line,
                      depDelay: connection.depDelay,
                      time: connection.time,
                      trackNumber: connection.track,
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

Future<Station> fetchStation() async {
  print("Calling server");
  final response = await http.get(
      'https://fahrplan.search.ch/api/stationboard.json?stop=8503020&show_trackchanges=true&show_delays=true&mode=depart&show_tracks=true&limit=30');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return Station.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.

    throw Exception(
        'Failed to load!\n ${response.statusCode} - ${response.body}');
  }
}

var myBox = SizedBox(
  width: 10.0,
  height: 10.0,
);
