import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class StationSelect extends StatefulWidget {
  StationSelect({Key key}) : super(key: key);

  @override
  _StationSelectState createState() => _StationSelectState();
}

class _StationSelectState extends State<StationSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Select Station"),
        ),
        body: TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
              autofocus: true,
              style: DefaultTextStyle.of(context)
                  .style
                  .copyWith(fontStyle: FontStyle.italic),
              decoration: InputDecoration(border: OutlineInputBorder())),
          suggestionsCallback: (pattern) async {
            final response = await http.get(
                "https://fahrplan.search.ch/api/completion.json?term=$pattern&show_ids=true");
            if (response.statusCode == 200) {
              var list = (jsonDecode(response.body) as List);
              print(list);
              return list;
            }
            return List<dynamic>.empty();
          },
          itemBuilder: (context, suggestion) {
            Icon myIcon = Icon(Icons.ac_unit);

            String iconText = suggestion['iconclass'].toString();
            if (iconText.contains('train')) {
              myIcon = Icon(Icons.train);
            }
            if (iconText.contains('bus')) {
              myIcon = Icon(Icons.bus_alert);
            }
            if (iconText.contains('tram')) {
              myIcon = Icon(Icons.tram);
            }

            return ListTile(
              leading: myIcon,
              title: Text(suggestion['label']),
            );
          },
          onSuggestionSelected: (suggestion) async {
            print("Selected Station $suggestion");
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString(stationKey, suggestion['id']);
            Navigator.of(context).pop();
          },
        ));
  }
}
