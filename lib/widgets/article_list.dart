import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../data.dart';
import '../screens/article_details.dart';
import '../models/articles.dart';
import 'error_icon.dart';
import 'circular_progress.dart';
import 'article_card.dart';
import 'article_type.dart';
import 'featured.dart';

class ArticleList extends StatefulWidget {
  final section;

  ArticleList({Key key, this.section}) : super(key: key);

  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  Future<ArticlesModel> futureData;

  @override
  void initState() {
    futureData = fetchData();
    super.initState();
  }

  void didUpdateWidget(ArticleList oldWidget) {
    if (oldWidget.section != widget.section) {
      futureData = fetchData();
    }
    super.didUpdateWidget(oldWidget);
  }

  fetchData() {
    return DefaultCacheManager()
        .getSingleFile(sections[widget.section]['url'])
        .then((value) {
      return ArticlesModel.fromJson(
        value.readAsStringSync(),
        headlines: widget.section == 'headlines',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<ArticlesModel>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return articlesList(snapshot.data);
              }
              if (snapshot.hasError) {
                return errorIcon();
              }
            }
            return CircularProgressIndicator();
          }),
    );
  }

  Widget articlesList(data) {
    return ListView(children: _generateArticleList(data));
  }

  List<Widget> _generateArticleList(data) {
    final cards = List<Widget>();

    cards.add(ArticleType(
      secName: data.main.secName,
      colorCode: data.main.colorCode,
    ));
    cards.add(mainArticle(data.main));
    if (widget.section == 'headlines') {
      cards.add(FeaturedArticles(articles: data.featured));
      cards.add(ArticleType(
        secName: 'JUST IN',
        color: sections['news']['color'],
      ));
      cards.addAll(articleCards(data.justIn));
      cards.add(ArticleType(
        secName: 'TOP PICKS',
        color: sections['news']['color'],
      ));
      cards.addAll(articleCards(data.topPicks));
      cards.add(ArticleType(
        secName: 'TRENDING',
        color: sections['news']['color'],
      ));
      cards.addAll(articleCards(data.trending));
    } else {
      cards.addAll(articleCards(data.stories));
    }
    return cards;
  }

  articleCards(articles) {
    var cards = List<Widget>();
    for (var story in articles) {
      cards.add(Column(
        children: <Widget>[
          Divider(),
          InkWell(
            child: ArticleCard(article: story),
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ArticleDetail(story)),
                ),
          ),
        ],
      ));
    }
    return cards;
  }

  Widget mainArticle(article) {
    return InkWell(
      onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ArticleDetail(article)),
          ),
      child: Stack(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: article.image,
            placeholder: (context, url) => circularProgress(),
            errorWidget: (context, url, error) => errorIcon(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(color: Color(0x77000000)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  article.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
