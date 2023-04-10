import 'package:flutter/material.dart';
import 'package:notio/Screens/Story/storyObject.dart';

import 'package:notio/utility.dart';
import 'package:story_view/story_view.dart';

class storyView extends StatefulWidget {
  storyView(@required this._stories, @required this._storyData);
  List<storyObject> _storyData = [];
  List<StoryItem> _stories = [];

  @override
  State<storyView> createState() => _storyViewState();
}

class _storyViewState extends State<storyView> {
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
                        "Sem 1",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Center(
            child: IconButton(onPressed: (){}, icon: Icon(Icons.bolt_sharp, size: 30, color: Colors.white,)),
          ),
          
          SizedBox(
            height: getheight(context, 15),
          )
        ],
      ),
    );
  }
}
