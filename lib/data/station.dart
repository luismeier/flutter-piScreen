import 'package:piScreen/data/connection.dart';

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stop != null) {
      data['stop'] = this.stop.toJson();
    }
    if (this.connections != null) {
      data['connections'] = this.connections.map((v) => v.toJson()).toList();
    }
    data['request'] = this.request;
    data['eof'] = this.eof;
    return data;
  }
}

class Stop {
  String id;
  String name;
  String x;
  String y;
  double lon;
  double lat;

  Stop({this.id, this.name, this.x, this.y, this.lon, this.lat});

  Stop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    x = json['x'];
    y = json['y'];
    lon = json['lon'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['x'] = this.x;
    data['y'] = this.y;
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    return data;
  }
}
