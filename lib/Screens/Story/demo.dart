import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notio/Screens/Story/storyObject.dart';
import 'package:notio/utility.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class demo extends StatefulWidget {
  demo({required this.stories});
  List<storyObject> stories = [];
  @override
  _demoState createState() => _demoState();
}

class _demoState extends State<demo> {
  // Replace this with your own list of stories

  int currentIndex = 0;
  bool _visible = true;
  int _time = 10;
  late Timer _timer;
  double _per = 1.0;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: _time), (timer) {
      if (currentIndex < widget.stories.length - 1) {
        setState(() {
          currentIndex++;
        });
      } else {
        Navigator.pop(context);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel(); // cancel the timer to free up resources
    super.dispose();
  }

  Future<void> change_story() async {
    print(currentIndex);
    if (currentIndex < widget.stories.length - 1) {
      currentIndex++;
      change_story();
    } else {
      Navigator.pop(context);
    }
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
                              image: AssetImage("images/sem1.png"),
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
                          }
                          else{
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
                ],
              ),
            ),
            Spacer(),
            Container(
              color: Color(0xff222222),
              child: Center(
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.bolt_sharp,
                      size: 30,
                      color: Colors.white,
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
