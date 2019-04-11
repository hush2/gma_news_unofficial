import 'package:flutter/material.dart';

class ArticleType extends StatelessWidget {
  final String secName;
  final String colorCode;

  ArticleType({Key key, this.secName, this.colorCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Color(int.parse('0xFF' + colorCode));
    return Container(
        decoration: BoxDecoration(color: color),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            secName.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
