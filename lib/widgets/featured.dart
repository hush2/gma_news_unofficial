import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/story.dart';
import '../screens/story_detail.dart';
import 'circular_progress.dart';
import 'error_icon.dart';
import 'story_type.dart';

class FeaturedStories extends StatelessWidget {
  final List<StoryModel> stories;

  FeaturedStories({Key key, this.stories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        featuredArticle(context, stories[0]),
        featuredArticle(context, stories[1]),
      ],
    );
  }
}

Widget featuredArticle(context, article) {
  return Expanded(
    flex: 1,
    child: InkWell(
      child: featuredCard(article),
      onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StoryDetail(article)),
          ),
    ),
  );
}

Widget featuredCard(StoryModel article) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      StoryType(
        secName: article.secName,
        colorCode: article.colorCode,
      ),
      CachedNetworkImage(
        height: 150,
        fit: BoxFit.cover,
        imageUrl: article.image,
        placeholder: (context, url) => circularProgress(),
        errorWidget: (context, url, error) => errorIcon(),
      ),
      Padding(
        padding: const EdgeInsets.all(6),
        child: Text(
          article.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}
