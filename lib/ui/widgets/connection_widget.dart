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
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(1, 0, 10, 0),
              child: Text(this.time, style: TextStyle(fontSize: 20)),
            ),
            this.depDelay == null
                ? SizedBox(
                    width: 40,
                  )
                : SizedBox(
                    width: 40,
                    child: Text(
                      "$depDelay\'",
                      style: TextStyle(
                          color: Theme.of(context).errorColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
            Container(
              child: Text(
                this.line,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 5),
            Text(this.destination,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(width: 10),
            Text("Gleis: $trackNumber", style: TextStyle(fontSize: 20))
          ],
        ),
      )),
    );
  }
}
