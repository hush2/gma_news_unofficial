import 'package:flutter/material.dart';

import 'lotto_numbers.dart';

class Lotto extends StatelessWidget {
  final lotto;
  final index;

  Lotto(this.lotto, this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Opacity(
          opacity: index == 0 ? 0 : 1,
          child: Icon(Icons.chevron_left, color: Colors.grey),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'LOTTO RESULT',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                lotto[index]['type'],
                style: TextStyle(fontSize: 18, color: Colors.blueGrey),
              ),
              Text(
                lotto[index]['post_date'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              LottoNumbers(lotto[index]['results']),
            ],
          ),
        ),
        Icon(Icons.chevron_right, color: Colors.grey),
      ],
    );
  }
}
