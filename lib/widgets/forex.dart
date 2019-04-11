import 'package:flutter/material.dart';

import '../models/sconfig.dart';

class Forex extends StatelessWidget {
  final Map<String, dynamic> forex;

  Forex(this.forex);

  @override
  Widget build(BuildContext context) {
    var sconfig = SconfigModel.fromJson('');
    var forex = sconfig.forex;
    return Row(
      children: <Widget>[
        Icon(
          Icons.chevron_left,
          color: Colors.grey,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '1 USD',
                style: TextStyle(fontSize: 22),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  forex['usd'],
                  style: TextStyle(fontSize: 40),
                ),
              ),
              Text(forex['date']),
            ],
          ),
        ),
        Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),
      ],
    );
  }
}
