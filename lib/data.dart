import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const base = 'https://data.gmanews.tv/zgmanews_contents/';
const page = 1;

const sections = {
  'sconfig': {
    'url': '${base}specialconfig_v1.json.gz',
  },
  'headlines': {
    'title': 'Headlines',
    'icon': FontAwesomeIcons.home,
    'color': Color(0xFFCC0000),
    'url': '${base}get_headlinesv2_1.json.gz',
  },
  'news': {
    'title': 'News',
    'icon': FontAwesomeIcons.newspaper,
    'color': Color(0xFFCC0000),
    'url': '${base}get_news$page.json.gz',
  },
  'sports': {
    'title': 'Sports',
    'icon': FontAwesomeIcons.basketballBall,
    'color': Color(0xFF264CC9),
    'url': '${base}get_sports$page.json.gz',
  },
  'money': {
    'title': 'Money',
    'icon': FontAwesomeIcons.moneyBill,
    'color': Color(0xFF1F6F1F),
    'url': '${base}get_economy$page.json.gz',
  },
  'scitech': {
    'title': 'SciTech',
    'icon': FontAwesomeIcons.lightbulb,
    'color': Color(0xFFFFA200),
    'url': '${base}get_scitech$page.json.gz',
  },
  'showbiz': {
    'title': 'Showbiz',
    'icon': FontAwesomeIcons.film,
    'color': Color(0xFFCD39A5),
    'url': '${base}get_showbiz$page.json.gz',
  },
  'lifestyle': {
    'title': 'Lifestyle',
    'icon': FontAwesomeIcons.instagram,
    'color': Color(0xFF6500CC),
    'url': '${base}get_lifestyle$page.json.gz',
  },
  'opinion': {
    'title': 'Opinion',
    'icon': FontAwesomeIcons.quoteLeft,
    'color': Color(0xFF993300),
    'url': '${base}get_opinion$page.json.gz',
  },
  'hashtag': {
    'title': 'Hashtag',
    'icon': FontAwesomeIcons.hashtag,
    'color': Color(0xFF42BFF0),
    'url': '${base}get_hashtag$page.json.gz',
  },
  'serbisyo': {
    'title': 'Serbisyo Publiko',
    'icon': FontAwesomeIcons.cross,
    'color': Color(0xFFFF4C1F),
    'url': '${base}get_serbisyopubliko$page.json.gz',
  },
};
