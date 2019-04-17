import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/story.dart';

class StoryDetail extends StatelessWidget {
  final StoryModel story;

  StoryDetail(this.story, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorCode;
    if (story.colorCode != null) {
      colorCode = Color(int.parse('0xFF' + story.colorCode.toUpperCase()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(story.secName),
        backgroundColor: colorCode,
      ),
      body: ListView(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: story.image,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Text(
              story.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Html(
            data: story.main,
            padding: EdgeInsets.symmetric(horizontal: 20),
          ),
        ],
      ),
    );
  }
}
