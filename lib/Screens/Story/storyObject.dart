import 'package:flutter/cupertino.dart';
import 'package:story_view/story_view.dart';

class storyObject {
  late MemoryImage _storyItem;
  late String _poster, _branch;
  late int _views;
  late int _bolts;
  late int _story_id;
  late String _bolts_by;

  storyObject(
      {required MemoryImage storyItem,
      required String poster,
      required int views,
      required int bolts,
      required int story_id,
      required String branch,
      required String bolts_by})
      : _storyItem = storyItem,
        _poster = poster,
        _views = views,
        _bolts = bolts,
        _story_id = story_id,
        _branch = branch,
        _bolts_by = bolts_by;

  MemoryImage getstoryItem() {
    return _storyItem;
  }

  String getBoltsBy() {
    return _bolts_by;
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

  void setBoltsBy(String bolts_by) {
    this._bolts_by = bolts_by;
  }
}
