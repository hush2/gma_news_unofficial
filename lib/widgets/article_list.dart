import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/articles.dart';
import '../models/article.dart';
import '../data.dart';
import '../screens/article_details.dart';

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
    super.initState();

    futureData = fetchData();
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
//        dummy,
        value.readAsStringSync(),
        headlines: widget.section == 'headlines',
      );
    });

//    return http.get(sections[widget.section]['url']).then((response) {
//      if (response.statusCode == 200) {
//        return ArticlesModel.fromJson(response.body);
//      } else {
//        throw Exception();
//      }
//    });
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
    return ListView(children: generateArticleList(data));
  }

  List<Widget> generateArticleList(data) {
    final cards = List<Widget>();

    cards.add(articleType());
    cards.add(mainArticle(data.main));
    if (widget.section == 'headlines') {
      cards.add(featuredArticles(data.featured));
      cards.addAll(articleCards(data.justIn));
      cards.addAll(articleCards(data.topPicks));
      cards.addAll(articleCards(data.trending));
    } else {
      cards.addAll(articleCards(data.stories));
    }
    return cards;
  }

  articleCards(articles) {
    var cards = List<Widget>();
    for (var story in articles) {
      cards.add(InkWell(
        child: articleCard(story),
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ArticleDetail(story)),
            ),
      ));
    }
    cards.add(Divider());
    return cards;
  }

  Widget articleCard(article) {
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

  Widget articleType([String colorCode, String secName]) {
    String title = sections[widget.section]['title'];
    Color color = sections[widget.section]['color'];
    // Only used in Featured article
    if (colorCode != null) {
      color = Color(int.parse('0xFF' + colorCode));
      title = secName;
    }
    return Container(
        decoration: BoxDecoration(color: color),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
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

  Widget featuredArticles(articles) {
    return Row(
      children: <Widget>[
        featuredArticle(articles[0]),
        featuredArticle(articles[1]),
      ],
    );
  }

  Widget featuredArticle(article) {
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
        articleType(article.colorCode, article.secName),
        CachedNetworkImage(
          height: 150,
          fit: BoxFit.cover,
          imageUrl: article.image,
          placeholder: (context, url) => circularProgress(),
          errorWidget: (context, url, error) => errorIcon(),
        ),
      ],
    );
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
}
