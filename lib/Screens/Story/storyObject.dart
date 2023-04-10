import 'package:flutter/cupertino.dart';
import 'package:story_view/story_view.dart';

class storyObject {
  late MemoryImage _storyItem;
  late String _poster, _branch;
  late int _views;
  late int _bolts;
  late int _story_id;

  storyObject(
      {required MemoryImage storyItem,
      required String poster,
      required int views,
      required int bolts,
      required int story_id,
      required String branch})
      : _storyItem = storyItem,
        _poster = poster,
        _views = views,
        _bolts = bolts,
        _story_id = story_id,
        _branch = branch;

  MemoryImage getstoryItem() {
    return _storyItem;
  }

  String getPoster() {
    return _poster;
  }

  int getViews() {
    return _views;
  }

  int getBolts() {
    return _bolts;
  }

  int getStoryId() {
    return _story_id;
  }

  String getBranch() {
    return _branch;
  }
}
