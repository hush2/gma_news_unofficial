import 'package:flutter/material.dart';

import 'widgets/app_drawer.dart';
import 'widgets/article_list.dart';

void main() => runApp(App());

const appName = 'GMA News Unofficial';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AppHome(title: appName),
    );
  }
}

class AppHome extends StatefulWidget {
  AppHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  String section = 'headlines';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: AppDrawer(
        (section) => setState(() {
              Navigator.pop(context);
              this.section = section.toLowerCase();
            }),
      ),
      body: ArticleList(section: section),
//        body: null,
    );
  }
}
