import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() => runApp(App());

const appName = 'GMA News Unofficial';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(title: appName),
    );
  }
}
