import 'dart:convert';
import 'article.dart';

class ArticlesModel {
  ArticleModel _main;
  List<ArticleModel> _stories = [];
  List<ArticleModel> _featured = [];
  List<ArticleModel> _justIn = [];
  List<ArticleModel> _topPicks = [];
  List<ArticleModel> _trending = [];

  ArticleModel get main => _main;
  List<ArticleModel> get stories => _stories;
  List<ArticleModel> get featured => _featured;
  List<ArticleModel> get justIn => _justIn;
  List<ArticleModel> get topPicks => _topPicks;
  List<ArticleModel> get trending => _trending;

  ArticlesModel.fromJson(String json, {headlines = false}) {
    var jsonObj = jsonDecode(json);

    if (headlines) {
      _main = articleModel(jsonObj['headlines'])[0];
      _featured = articleModel(jsonObj['featured_stories']);
      _justIn = articleModel(jsonObj['just_in']);
      _topPicks = articleModel(jsonObj['top_picks']);
      _trending = articleModel(jsonObj['trending']);
    } else {
      _main = articleModel(jsonObj['main'])[0];
      _stories = articleModel(jsonObj['stories']);
    }
  }
}

articleModel(articles) {
  List<ArticleModel> _articles = [];
  articles.forEach((item) {
    _articles.add(new ArticleModel(
      title: item['title'],
      main: item['main'],
      teaser: item['teaser'],
      date: item['date'],
      image: item['base_url'] + item['base_filename'],
      secName: item['sec_name'],
      colorCode: item['color_code'],
    ));
  });
  return _articles;
}
