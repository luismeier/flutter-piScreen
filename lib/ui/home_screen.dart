import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:piScreen/providers/timetable_provider.dart';
import 'package:piScreen/ui/timtable_view.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _timeString = "Time";
  String _datumString = "Datum";

  @override
  void initState() {
    super.initState();
    _timeString =
        "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
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
    return DateFormat('HH:mm:ss').format(dateTime);
  }

  String _formatDate(DateTime dateTime) {
    return DateFormat('dd.MM.yyyy').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: TimeTableView(),
              ),
            ),
            Container(
              color: Colors.blue,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top,
              ),
            )
          ],
        ));
  }
}
