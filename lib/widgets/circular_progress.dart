import 'package:flutter/material.dart';

Widget circularProgress() {
  return Center(
    child: SizedBox(
      width: 30,
      height: 30,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
      ),
    ),
  );
}
