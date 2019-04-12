import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import '../widgets/story_list.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String section = 'headlines';

  _drawerItemTapped(section) {
    setState(() {
      Navigator.pop(context);
      this.section = section.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      drawer: AppDrawer(onItemTap: _drawerItemTapped),
      body: StoryList(section: section),
    );
  }
}
