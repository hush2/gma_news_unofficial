import 'package:flutter/material.dart';

class Forex extends StatelessWidget {
  final Map<String, dynamic> forex;

  Forex(this.forex, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.chevron_left, color: Colors.grey),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "FOREX",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '1 USD',
                style: TextStyle(fontSize: 22),
              ),
              Text(
                forex['usd'],
                style: TextStyle(fontSize: 40, color: Colors.green[800]),
              ),
              Text(forex['date']),
            ],
          ),
        ),
        Opacity(
          opacity: 0,
          child: Icon(Icons.chevron_right, color: Colors.grey),
        ),
      ],
    );
  }
}
