class Terminal {
  String id;
  String name;
  int x;
  int y;
  double lon;
  double lat;

  Terminal({this.id, this.name, this.x, this.y, this.lon, this.lat});

  Terminal.fromJson(Map<String, dynamic> json) {
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