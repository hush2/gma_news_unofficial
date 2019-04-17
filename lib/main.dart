import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/home.dart';

void main() => runApp(App());

const appName = 'GMA News Unofficial';

class App extends StatelessWidget {
  App() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
  }

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
