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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: AspectRatio(
              child: CachedNetworkImage(
                imageUrl: story.image,
                fit: BoxFit.fitHeight,
                placeholder: (context, url) => circularProgress(),
                errorWidget: (context, url, error) => errorIcon(),
              ),
              aspectRatio: 4 / 3,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Text(
                    story.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.0),
                    child: Text(
                      story.teaser,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(story.date),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
