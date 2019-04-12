import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/story.dart';
import 'circular_progress.dart';
import 'error_icon.dart';

class StoryCard extends StatelessWidget {
  final StoryModel story;

  StoryCard({Key key, this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: CachedNetworkImage(
            imageUrl: story.image,
            placeholder: (context, url) => circularProgress(),
            errorWidget: (context, url, error) => errorIcon(),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
            child: Column(
              children: <Widget>[
                Text(
                  story.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(story.date),
                Text(
                  story.teaser,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
