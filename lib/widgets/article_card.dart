import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/article.dart';

class ArticleCard extends StatelessWidget {
  final ArticleModel article;

  ArticleCard({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: CachedNetworkImage(
            imageUrl: article.image,
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
                  article.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(article.date),
                Text(
                  article.teaser,
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

Widget circularProgress() {
  return Center(
    child: SizedBox(
      width: 30,
      height: 30,
      child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.grey)),
    ),
  );
}

Widget errorIcon() {
  return Icon(
    Icons.warning,
    size: 30,
    color: Colors.yellow[700],
  );
}
