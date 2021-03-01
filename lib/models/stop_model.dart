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
}
