import 'package:flutter/material.dart';
import 'package:notio/Screens/Story/storyObject.dart';

import 'package:notio/utility.dart';
import 'package:story_view/story_view.dart';

class myStoryView extends StatefulWidget {
  myStoryView(@required this._stories, @required this._storyData);
  List<storyObject> _storyData = [];
  List<StoryItem> _stories = [];

  @override
  State<myStoryView> createState() => _myStoryViewState();
}

class _myStoryViewState extends State<myStoryView> {
  final _controller = StoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.black, // Status bar color
      ),
      backgroundColor: Color(0xff222222),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Center(child: Text(_image.value.toString(), style: TextStyle(color: Colors.white),)),
          Container(
            height: MediaQuery.of(context).size.height * 0.86,
            width: MediaQuery.of(context).size.width * 1,
            child: Stack(
              children: [
                StoryView(
                  storyItems: widget._stories,
                  controller: _controller,
                  repeat: true,
                  progressPosition: ProgressPosition.top,
                  indicatorColor: blueColor,
                  onComplete: () {
                    Navigator.pop(context);
                  },
                ),
                Positioned(
                  left: 20,
                  top: 30,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("images/sem1.png"),
                        height: 35,
                      ),
                      SizedBox(
                        height: getwidth(context, 5),
                      ),
                      Text(
                        "Rahul Nigga",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getwidth(context, 25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage("images/sem1.png"),
                      height: 25,
                    ),
                    SizedBox(
                      height: getheight(context, 4),
                    ),
                    Text(
                      "25 👀",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.bolt_outlined,
                  color: Colors.amber,
                  size: 30,
                )
              ],
            ),
          ),
          SizedBox(
            height: getheight(context, 15),
          )
        ],
      ),
    );
  }
}
