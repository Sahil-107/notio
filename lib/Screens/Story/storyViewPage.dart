import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notio/Screens/Story/storyObject.dart';
import 'package:notio/apiServices/authServices.dart';
import 'package:notio/apiServices/storyModuleServices.dart';
import 'package:notio/main.dart';
import 'package:notio/utility.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class storyViewPage extends StatefulWidget {
  storyViewPage({required this.stories, required this.sem});
  List<storyObject> stories = [];
  String sem;
  @override
  _storyViewPageState createState() => _storyViewPageState();
}

class _storyViewPageState extends State<storyViewPage> {
  int currentIndex = 0;
  bool _visible = true;
  int _time = 15;
  late Timer _timer;
  double _per = 1.0;
  storyServices _ss = new storyServices();

  @override
  void initState() {
    addStoryView();
    _timer = Timer.periodic(Duration(seconds: _time), (timer) {
      if (currentIndex < widget.stories.length - 1) {
        setState(() {
          currentIndex++;
          addStoryView();
        });
      } else {
        Navigator.pop(context);
      }
    });
    super.initState();
  }

  void addStoryView() {
    String viewed_by = widget.stories[currentIndex].getViewedBy();
    if (!viewed_by.contains(currentUser.id.toString())) {
      viewed_by += currentUser.id.toString() + "#";
      _ss.addView({
        "views": widget.stories[currentIndex].getViews() + 1,
        "story_id": widget.stories[currentIndex].getStoryId(),
        "viewed_by": viewed_by
      });
      widget.stories[currentIndex].setViewedBy(viewed_by);
    }

    setState(() {});
  }

  @override
  void dispose() {
    _timer.cancel(); // cancel the timer to free up resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (details) {
        setState(() {
          _visible = false;
        });
      },
      onLongPressEnd: ((details) {
        setState(() {
          _visible = true;
        });
      }),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.black, // Status bar color
        ),
        body: Column(
          children: [
            // Display the current story
            Container(
              height: getheight(context, 722),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: widget.stories[currentIndex].getstoryItem(),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 20,
                    top: 30,
                    child: Visibility(
                      visible: _visible,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.2)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage("images/sem${widget.sem}.png"),
                              height: 35,
                            ),
                            SizedBox(
                              width: getwidth(context, 5),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.stories[currentIndex].getPoster(),
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  widget.stories[currentIndex].getBranch(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 10,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (currentIndex != 0) {
                            currentIndex--;
                          } else {
                            Navigator.pop(context);
                          }
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: 100,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (currentIndex < widget.stories.length - 1) {
                            currentIndex++;
                            addStoryView();
                          } else {
                            Navigator.pop(context);
                          }
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: 100,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 5,
                    left: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        widget.stories.length,
                        (index) => Visibility(
                          visible: _visible,
                          child: LinearPercentIndicator(
                            backgroundColor: Colors.grey,
                            width: MediaQuery.of(context).size.width /
                                    widget.stories.length -
                                10,
                            animation: true,
                            lineHeight: 5.0,
                            animationDuration: _time * 1000,
                            percent: _per,
                            padding: EdgeInsets.only(right: 5),
                            restartAnimation: true,
                            barRadius: Radius.circular(20),
                            animateFromLastPercent: true,
                            progressColor:
                                currentIndex == index ? blueColor : Colors.grey,
                          ),
                          // child: Container(
                          //   margin: EdgeInsets.only(right: 5),
                          //   width: MediaQuery.of(context).size.width /
                          //           widget.stories.length -
                          //       10,
                          //   height: 5,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(20),
                          //     color: currentIndex == index
                          //         ? blueColor
                          //         : Colors.grey,
                          //   ),
                          // ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: getheight(context, 620),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        width: MediaQuery.of(context).size.width,
                        decoration:
                            BoxDecoration(color: Colors.white.withOpacity(0.4)),
                        child: Center(
                            child: Text(
                          widget.stories[currentIndex].getCaption(),
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        )),
                      ))
                ],
              ),
            ),
            Spacer(),
            Container(
              color: Color(0xff222222),
              child: Center(
                child: IconButton(
                    onPressed: () async {
                      if (!widget.stories[currentIndex].getBoltsBy().contains(
                            currentUser.id.toString(),
                          )) {
                        String bolts_by =
                            widget.stories[currentIndex].getBoltsBy();
                        bolts_by += currentUser.id.toString() + "#";
                        int bolts = widget.stories[currentIndex].getBolts();
                        bolts += 1;
                        var x = await _ss.addBolt({
                          "bolts_by": bolts_by,
                          "story_id": widget.stories[currentIndex].getStoryId(),
                          "bolts": bolts
                        });
                        setState(() {
                          widget.stories[currentIndex]
                              .setBoltsBy(jsonDecode(x.body)["bolts_by"]);
                        });
                      }
                    },
                    icon: Icon(
                      Icons.bolt_sharp,
                      size: 30,
                      color: widget.stories[currentIndex]
                              .getBoltsBy()
                              .contains(currentUser.id.toString())
                          ? Colors.amber
                          : Colors.white,
                    )),
              ),
            ),

            // Display a row of dots to indicate the current story position
          ],
        ),
      ),
    );
  }
}
