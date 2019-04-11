import 'package:flutter/material.dart';

import 'lotto_numbers.dart';
import '../models/sconfig.dart';

class Lotto extends StatefulWidget {
  @override
  _LottoState createState() => _LottoState();
}

class _LottoState extends State<Lotto> {
  var sconfig;

  @override
  Widget build(BuildContext context) {
    sconfig = SconfigModel.fromJson('');
    var lotto = sconfig.lotto;
    return Row(
      children: <Widget>[
        Icon(
          Icons.chevron_left,
          color: Colors.grey,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'LOTTO RESULT',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  lotto[0]['type'],
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  lotto[0]['post_date'],
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              LottoNumbers(lotto[0]['results']),
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
