import 'dart:convert';

import 'story.dart';

class StoriesModel {
  StoryModel _main;
  List<StoryModel> _stories = [];
  List<StoryModel> _featured = [];
  List<StoryModel> _justIn = [];
  List<StoryModel> _topPicks = [];
  List<StoryModel> _trending = [];

  StoryModel get main => _main;
  List<StoryModel> get stories => _stories;
  List<StoryModel> get featured => _featured;
  List<StoryModel> get justIn => _justIn;
  List<StoryModel> get topPicks => _topPicks;
  List<StoryModel> get trending => _trending;

  StoriesModel.fromJson(String json, {headlines = false}) {
    var jsonObj = jsonDecode(json);

    if (headlines) {
      _main = storyModel(jsonObj['headlines'])[0];
      _featured = storyModel(jsonObj['featured_stories']);
      _justIn = storyModel(jsonObj['just_in']);
      _topPicks = storyModel(jsonObj['top_picks']);
      _trending = storyModel(jsonObj['trending']);
    } else {
      _main = storyModel(jsonObj['main'])[0];
      _stories = storyModel(jsonObj['stories']);
    }
  }
}

storyModel(stories) {
  List<StoryModel> _stories = [];
  stories.forEach((item) {
    _stories.add(new StoryModel(
      title: item['title'],
      main: item['main'],
      teaser: item['teaser'],
      date: item['date'],
      image: item['base_url'] + item['base_filename'],
      secName: item['sec_name'],
      colorCode: item['color_code'],
    ));
  });
  return _stories;
}
