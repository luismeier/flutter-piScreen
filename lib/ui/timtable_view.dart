import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piScreen/providers/timetable_provider.dart';
import 'package:provider/provider.dart';

import '../models/connection_model.dart';
import 'widgets/connection_widget.dart';

class TimeTableView extends StatelessWidget {
  TimeTableView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimeTableProvider>(context);
    if (provider.station != null) {
      return Scrollbar(
        child: ListView.builder(
            itemCount: provider.station.connections.length,
            itemBuilder: (context, index) {
              Connections connection = provider.station.connections[index];
              return new ConnectionWidget(
                destination: connection.terminal.name,
                line: connection.line,
                depDelay: connection.depDelay,
                time: connection.time,
                trackNumber: connection.track,
              );
            }),
      );
    } else {
      return Center(
        child: SizedBox(
          width: 60,
          height: 60,
          child: CircularProgressIndicator(
            strokeWidth: 4.0,
            valueColor: new AlwaysStoppedAnimation(Colors.blue),
          ),
        ),
      );
    }
  }
}
