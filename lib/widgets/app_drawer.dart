import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data.dart';
import 'lotto.dart';
import 'forex.dart';

class AppDrawer extends StatelessWidget {
  final fetchArticles;

  AppDrawer(this.fetchArticles);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFDCE6EE),
              ),
              child: PageView(
                children: <Widget>[
                  Lotto(),
                  Lotto(),
                  Forex({}),
                ],
              ),
            ),
            drawerItem('headlines'),
            drawerItem('news'),
            drawerItem('sports'),
            drawerItem('money'),
            drawerItem('scitech'),
            drawerItem('showbiz'),
            drawerItem('lifestyle'),
            drawerItem('opinion'),
            drawerItem('hashtag'),
            drawerItem('serbisyo'),
            githubLink(),
          ],
        ),
      ),
    );
  }

  drawerItem(String section) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Icon(
          sections[section]['icon'],
          color: sections[section]['color'],
        ),
      ),
      title: Text(
        sections[section]['title'],
        style: TextStyle(
          color: sections[section]['color'],
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () => fetchArticles(section),
    );
  }

  final String hushLink = 'https://github.com/hush2';

  githubLink() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: Text(
          hushLink,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
        onTap: () => launch(hushLink),
      ),
    );
  }
}
