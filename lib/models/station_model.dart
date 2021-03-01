import 'package:piScreen/models/connection_model.dart';
import 'package:piScreen/models/stop_model.dart';

class Station {
  Stop stop;
  List<Connections> connections;
  String request;
  int eof;

  Station({this.stop, this.connections, this.request, this.eof});

  Station.fromJson(Map<String, dynamic> json) {
    stop = json['stop'] != null ? new Stop.fromJson(json['stop']) : null;
    if (json['connections'] != null) {
      connections = new List<Connections>();
      json['connections'].forEach((v) {
        connections.add(new Connections.fromJson(v));
      });
    }
    request = json['request'];
    eof = json['eof'];
  }
}
