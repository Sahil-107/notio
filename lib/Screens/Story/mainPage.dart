import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:notio/widgets.dart';
import 'package:story_view/story_view.dart';

class storyView extends StatefulWidget {
  const storyView({Key? key}) : super(key: key);

  @override
  State<storyView> createState() => _storyViewState();
}

class _storyViewState extends State<storyView> {
  final _controller = StoryController();

  @override
  Widget build(BuildContext context) {
    List<StoryItem> storyItems = [
      StoryItem(
          Image(
            height: MediaQuery.of(context).size.height,
            image: NetworkImage(
                "https://firebasestorage.googleapis.com/v0/b/notio-2053b.appspot.com/o/IMG_20220303_205257_385.webp?alt=media&token=87b4e9d7-6357-41e9-b381-466d29f2b583"),
          ),
          duration: Duration(seconds: 200)),
      StoryItem(
          Image(
            height: MediaQuery.of(context).size.height,
            image: NetworkImage(
                "https://firebasestorage.googleapis.com/v0/b/notio-2053b.appspot.com/o/IMG_20211203_092846_100.webp?alt=media&token=2bb23f19-1a6b-4196-95f6-9248b717d036"),
          ),
          duration: Duration(seconds: 200)),
      StoryItem(
          Image(
            height: MediaQuery.of(context).size.height,
            image: NetworkImage(
                "https://firebasestorage.googleapis.com/v0/b/notio-2053b.appspot.com/o/IMG_20211110_194301_524.webp?alt=media&token=a80596ce-672b-42ec-a0b8-e2bc14854b91"),
          ),
          duration: Duration(seconds: 200)),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: StoryView(
              storyItems: storyItems,
              controller: _controller,
              repeat: true,
              indicatorColor: Colors.blue,
              onComplete: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
