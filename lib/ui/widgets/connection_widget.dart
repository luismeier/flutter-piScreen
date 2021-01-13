import 'package:flutter/material.dart';

class ConnectionWidget extends StatelessWidget {
  const ConnectionWidget({
    Key key,
    @required this.destination,
    @required this.line,
    @required this.time,
    @required this.depDelay,
    @required this.trackNumber,
  }) : super(key: key);

  final String destination;
  final String line;
  final String time;
  final String depDelay;
  final String trackNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 50,
              child: Text(
                this.line,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
                          child: Text(this.destination,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            Text(this.time, style: TextStyle(fontSize: 20)),
            this.depDelay == null
                ? Text("")
                : Text(
                    "$depDelay\'",
                    style: TextStyle(
                        color: Theme.of(context).errorColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(width: 10),
            Text("Gleis: $trackNumber",style: TextStyle(fontSize: 20))
          ],
        ),
      )),
    );
  }
}
