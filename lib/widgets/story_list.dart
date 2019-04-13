import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../data.dart';
import '../screens/story_detail.dart';
import '../models/stories.dart';
import 'error_icon.dart';
import 'circular_progress.dart';
import 'story_card.dart';
import 'story_type.dart';
import 'featured.dart';

class StoryList extends StatefulWidget {
  final section;

  StoryList({Key key, this.section}) : super(key: key);

  @override
  _StoryListState createState() => _StoryListState();
}

class _StoryListState extends State<StoryList> {
  Future<StoriesModel> _futureData;

  @override
  void initState() {
    _futureData = _fetchData();
    super.initState();
  }

  void didUpdateWidget(StoryList oldWidget) {
    if (oldWidget.section != widget.section) {
      _futureData = _fetchData();
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<StoriesModel> _fetchData() async {
    var data = await DefaultCacheManager()
        .getSingleFile(sections[widget.section]['url']);
    return StoriesModel.fromJson(
      data.readAsStringSync(),
      headlines: widget.section == 'headlines',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<StoriesModel>(
          future: _futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return storyList(snapshot.data);
              }
              if (snapshot.hasError) {
                return errorIcon();
              }
            }
            return CircularProgressIndicator();
          }),
    );
  }

  Widget storyList(data) {
    return ListView(children: _generateStoryList(data));
  }

  List<Widget> _generateStoryList(data) {
    final cards = List<Widget>();

    cards.add(StoryType(
      secName: data.main.secName,
      colorCode: data.main.colorCode,
    ));
    cards.add(mainStory(data.main));
    if (widget.section == 'headlines') {
      cards.add(FeaturedStories(stories: data.featured));
      cards.add(StoryType(
        secName: 'JUST IN',
        color: sections['news']['color'],
      ));
      cards.addAll(storyCards(data.justIn));
      cards.add(StoryType(
        secName: 'TOP PICKS',
        color: sections['news']['color'],
      ));
      cards.addAll(storyCards(data.topPicks));
      cards.add(StoryType(
        secName: 'TRENDING',
        color: sections['news']['color'],
      ));
      cards.addAll(storyCards(data.trending));
    } else {
      cards.addAll(storyCards(data.stories));
    }
    return cards;
  }

  storyCards(stories) {
    var cards = List<Widget>();
    for (var story in stories) {
      cards.add(Column(
        children: <Widget>[
          InkWell(
            child: StoryCard(story: story),
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StoryDetail(story)),
                ),
          ),
          Divider(),
        ],
      ));
    }
    return cards;
  }

  Widget mainStory(story) {
    return InkWell(
      onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StoryDetail(story)),
          ),
      child: Stack(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: story.image,
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
                  story.title,
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
