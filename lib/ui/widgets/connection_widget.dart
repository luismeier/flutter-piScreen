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
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              timeWidget(context),
              SizedBox(width: 5),
              SizedBox(
                width: 40,
                child: Text(
                  this.line,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Text(
                  this.destination,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Gl: $trackNumber",
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget timeWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          this.time,
        ),
        SizedBox(
          width: 30,
          child: this.depDelay == null
              ? Text("")
              : Text(
                  "$depDelay\'",
                  style: TextStyle(
                    color: Theme.of(context).errorColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
        ),
      ],
    );
  }
}
