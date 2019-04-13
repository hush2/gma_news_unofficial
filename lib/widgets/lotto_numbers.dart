import 'package:flutter/material.dart';

class LottoNumbers extends StatelessWidget {
  final List<dynamic> results;

  LottoNumbers(this.results, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        circleWithText(results[0]),
        circleWithText(results[1]),
        circleWithText(results[2]),
        circleWithText(results[3]),
        circleWithText(results[4]),
        circleWithText(results[5]),
      ],
    );
  }
}

Widget circleWithText(text) {
  return Container(
    decoration: BoxDecoration(
      color: Color(0xFF9C9310),
      shape: BoxShape.circle,
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    ),
  );
}
