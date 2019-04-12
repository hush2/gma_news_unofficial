import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/article.dart';
import '../screens/article_details.dart';
import 'circular_progress.dart';
import 'error_icon.dart';
import 'article_type.dart';

class FeaturedArticles extends StatelessWidget {
  final List<ArticleModel> articles;

  FeaturedArticles({Key key, this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        featuredArticle(context, articles[0]),
        featuredArticle(context, articles[1]),
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
            MaterialPageRoute(builder: (context) => ArticleDetail(article)),
          ),
    ),
  );
}

Widget featuredCard(ArticleModel article) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      ArticleType(
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
