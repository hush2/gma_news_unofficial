import 'dart:convert';

import 'story.dart';

class StoriesModel {
  StoryModel main;
  List<StoryModel> stories = [];
  List<StoryModel> featured = [];
  List<StoryModel> justIn = [];
  List<StoryModel> topPicks = [];
  List<StoryModel> trending = [];

  StoriesModel.fromJson(String json, {headlines = false}) {
    var jsonObj = jsonDecode(json);

    if (headlines) {
      main = _storyModel(jsonObj['headlines'])[0];
      featured = _storyModel(jsonObj['featured_stories']);
      justIn = _storyModel(jsonObj['just_in']);
      topPicks = _storyModel(jsonObj['top_picks']);
      trending = _storyModel(jsonObj['trending']);
    } else {
      main = _storyModel(jsonObj['main'])[0];
      stories = _storyModel(jsonObj['stories']);
    }
  }
}

_storyModel(stories) {
  List<StoryModel> _stories = [];
  for (var story in stories) {
    _stories.add(new StoryModel(
      title: story['title'],
      main: story['main'],
      teaser: story['teaser'],
      date: story['date'],
      image: story['base_url'] + story['base_filename'],
      secName: story['sec_name'],
      colorCode: story['color_code'],
    ));
  }
  return _stories;
}
