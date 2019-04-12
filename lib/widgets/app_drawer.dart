import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data.dart';
import '../models/sconfig.dart';
import 'error_icon.dart';
import 'lotto.dart';
import 'forex.dart';

class AppDrawer extends StatefulWidget {
  final onItemTap;

  AppDrawer({Key key, this.onItemTap}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  Future<SconfigModel> futureData;

  @override
  void initState() {
    futureData = _fetchData();
    super.initState();
  }

  _fetchData() {
    return DefaultCacheManager()
        .getSingleFile(sections['sconfig']['url'])
        .then((value) {
      return SconfigModel.fromJson(value.readAsStringSync());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(color: Color(0xFFDCE6EE)),
              child: Container(child: _buildDrawerHeader()),
            ),
            _buildDrawerItem('headlines'),
            _buildDrawerItem('news'),
            _buildDrawerItem('sports'),
            _buildDrawerItem('money'),
            _buildDrawerItem('scitech'),
            _buildDrawerItem('showbiz'),
            _buildDrawerItem('lifestyle'),
            _buildDrawerItem('opinion'),
            _buildDrawerItem('hashtag'),
            _buildDrawerItem('serbisyo'),
            _githubLink(),
          ],
        ),
      ),
    );
  }

  _buildDrawerHeader() {
    return FutureBuilder<SconfigModel>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return _buildPageView(snapshot.data);
            }
            if (snapshot.hasError) {
              return errorIcon();
            }
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  PageView _buildPageView(data) {
    return PageView(
      children: <Widget>[
        Lotto(data.lotto, 0),
        Lotto(data.lotto, 1),
        Forex(data.forex),
      ],
    );
  }

  _buildDrawerItem(String section) {
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
      onTap: () => widget.onItemTap(section),
    );
  }

  final String hushLink = 'https://github.com/hush2';

  _githubLink() {
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
