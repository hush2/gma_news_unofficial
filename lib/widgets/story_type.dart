import 'package:flutter/material.dart';

class StoryType extends StatelessWidget {
  final String secName;
  final String colorCode;
  final Color color;

  StoryType({Key key, this.secName, this.colorCode, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = this.color;

    if (color == null && colorCode != null) {
      color = Color(int.parse('0xFF' + colorCode.toUpperCase()));
    }
    return Container(
        decoration: BoxDecoration(color: color),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            secName == null ? '' : secName.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
