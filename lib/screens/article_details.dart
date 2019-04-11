import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/article.dart';

class ArticleDetail extends StatelessWidget {
  final ArticleModel article;

  ArticleDetail(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.secName),
      ),
      body: ListView(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: article.image,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Text(
              article.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Html(
            data: article.main,
            padding: EdgeInsets.symmetric(horizontal: 20),
          ),
        ],
      ),
    );
  }
}
