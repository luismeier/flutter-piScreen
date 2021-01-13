import 'package:piScreen/data/terminal.dart';

class Connections {
  String time;
  String g;
  String l;
  String type;
  String line;
  String operator;
  String number;
  String color;
  String typeName;
  Terminal terminal;
  String arrDelay;
  String depDelay;

  Connections(
      {this.time,
      this.g,
      this.l,
      this.type,
      this.line,
      this.operator,
      this.number,
      this.color,
      this.typeName,
      this.terminal,
      this.arrDelay,
      this.depDelay});

  Connections.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    g = json['*G'];
    l = json['*L'];
    type = json['type'];
    line = json['line'];
    operator = json['operator'];
    number = json['number'];
    color = json['color'];
    typeName = json['type_name'];
    terminal = json['terminal'] != null
        ? new Terminal.fromJson(json['terminal'])
        : null;
    arrDelay = json['arr_delay'];
    depDelay = json['dep_delay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['*G'] = this.g;
    data['*L'] = this.l;
    data['type'] = this.type;
    data['line'] = this.line;
    data['operator'] = this.operator;
    data['number'] = this.number;
    data['color'] = this.color;
    data['type_name'] = this.typeName;
    if (this.terminal != null) {
      data['terminal'] = this.terminal.toJson();
    }
    data['arr_delay'] = this.arrDelay;
    data['dep_delay'] = this.depDelay;
    return data;
  }
}


