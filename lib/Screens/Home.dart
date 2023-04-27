import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notio/Screens/Auth/Loading.dart';
import 'package:notio/Screens/Blogs/blog.dart';
import 'package:notio/Screens/NoteModule/noteModule.dart';
import 'package:notio/Screens/Story/storyViewPage.dart';
import 'package:notio/Screens/Story/mainStoryPage.dart';
import 'package:notio/Screens/Story/storyObject.dart';
import 'package:notio/apiServices/storyModuleServices.dart';
import 'package:notio/main.dart';
import 'package:notio/utility.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:story_view/story_view.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  List<Widget> _sems = [];

  _addSems() async {
    _sems = [
      myStories(sem: currentUser.sem.toString(), stories: 0, storyData: [])
    ];
    for (var i = 1; i < 9; i++) {
      var x = await _getStrories(i);
      _sems.add(Semester(
          sem: i.toString(), stories: await x[0], storyData: await x[1]));
      setState(() {});
    }

    // _sems.sort((a, b) => a.stories.length.compareTo(b.stories.length));
    // _sems.insert(0, _sems[_sems.length-1]);
    // _sems.removeAt(_sems.length - 1);
  }

  Future<List> _getStrories(sem) async {
    int _stories_len = 0;
    List<storyObject> _storyData = [];
    storyServices storyService = new storyServices();
    var res = await storyService.getStroiesapi({
      "id": currentUser.id,
      "sem": sem,
      "college": currentUser.college,
      "university": currentUser.university,
      "branch": currentUser.branch
    });

    for (var element in jsonDecode(res.body)["Stories"]) {
      Rx<String> _image = element["image"].toString().obs;
      // _stories.add(StoryItem.pageProviderImage(
      //   MemoryImage(
      //     base64Decode(_image.value),
      //   ),
      //   caption: "by: " + element["name"],
      //   duration: Duration(seconds: 15),
      // ));

      _stories_len += 1;

      _storyData.add(
        storyObject(
            storyItem: MemoryImage(
              base64Decode(_image.value),
            ),
            poster: element["name"],
            views: element["views"],
            bolts: element["bolts"],
            bolts_by: element["bolts_by"],
            story_id: element["story_id"],
            branch: element["branch"]),
      );
    }
    return [_stories_len, _storyData];
  }

  void _onRefresh() async {
    await _addSems();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    _addSems();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.blue, // Status bar color
      ),
      backgroundColor: bg,
      body: SmartRefresher(
        // header: WaterDropHeader(),
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        controller: _refreshController,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getheight(context, 20)),
              Container(
                height: getheight(context, 80),
                padding:
                    EdgeInsets.symmetric(horizontal: getwidth(context, 20)),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hi, ${currentUser.name} !"),
                        SizedBox(height: getheight(context, 10)),
                        Text(
                          "Welcome back",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w900),
                        )
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.notifications)
                  ],
                ),
              ),
              Container(
                  height: getheight(context, 92),
                  margin: EdgeInsets.only(
                      left: getwidth(context, 10),
                      right: getwidth(context, 10)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: _sems),
                  )),
              SizedBox(
                height: getheight(context, 20),
              ),
              CarouselSlider(
                options: CarouselOptions(
                    clipBehavior: Clip.none,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    viewportFraction: 0.7,
                    height: getheight(context, 280)),
                items: [{}, {}, {}].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return noteWidget();
                    },
                  );
                }).toList(),
              ),
              SizedBox(
                height: getheight(context, 30),
              ),
              Center(
                child: Text(
                  "Might be useful",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(
                height: getheight(context, 17),
              ),
              Container(
                // height: getheight(context, 200),
                child: Column(
                  children: [
                    Column(
                      children: [
                        ArticleWidget(),
                        ArticleWidget(),
                        ArticleWidget(),
                        ArticleWidget(),
                      ],
                    ),
                    SizedBox(
                      height: getheight(context, 85),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class noteWidget extends StatelessWidget {
  const noteWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(NoteModule());
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => NoteModule()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ],
            image: DecorationImage(
                image: AssetImage('images/chip2.jpg'), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(28)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(
                  getwidth(context, 25), 0, 0, getheight(context, 20)),
              width: getwidth(context, 170),
              child: Text(
                "VLSI Technology",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BlogPostScreen()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black.withOpacity(0.03)),
          boxShadow: [
            // BoxShadow(
            //   color: Colors.black.withOpacity(0.10),
            //   spreadRadius: 3,
            //   blurRadius: 8,
            //   offset: Offset(0, 4),
            // ),
          ],
        ),
        height: getheight(context, 141),
        margin: EdgeInsets.only(
            left: getwidth(context, 25),
            right: getwidth(context, 25),
            bottom: getheight(context, 15)),
        child: Row(
          children: [
            Container(
              width: getwidth(context, 92),
              // height: getheight(context, 121),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/articles.png"))),
            ),
            SizedBox(
              width: getwidth(context, 20),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BIG DATA",
                  style: TextStyle(
                      color: Color(0xff376AED),
                      fontSize: 16,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: getwidth(context, 4),
                ),
                Container(
                    width: getwidth(context, 160),
                    child: Text("Why big data needs thick data ?"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Semester extends StatelessWidget {
  Semester({required this.sem, required this.stories, required this.storyData});

  String sem;
  int stories;
  List<storyObject> storyData = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            if ((await stories) != 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => storyViewPage(
                          stories: storyData,
                        )),
              );
            }
          },
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: 5, left: 6),
                height: getheight(context, 65),
                width: getheight(context, 65),
                padding: EdgeInsets.all(5),
                child: Image(image: AssetImage("images/sem$sem.png")),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: (stories != 0 ? Color(0xff376AED) : Colors.grey),
                      width: 3),
                  borderRadius: BorderRadius.circular(18),
                  //image: DecorationImage(image: AssetImage("images/sem1.png")),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Semester $sem",
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
          // child: FutureBuilder<List<StoryItem>>(
          //   future: _stories,
          //   builder: (BuildContext context,
          //       AsyncSnapshot<List<StoryItem>> snapshot) {
          //     if (!snapshot.hasData) {
          //       return Column(
          //         children: [
          //           Container(
          //             margin: EdgeInsets.only(right: 5, left: 6),
          //             height: getheight(context, 65),
          //             width: getheight(context, 65),
          //             padding: EdgeInsets.all(5),
          //             child: Image(
          //                 image: AssetImage("images/sem${widget.sem}.png")),
          //             decoration: BoxDecoration(
          //               border: Border.all(
          //                   color: (snapshot.data!.isNotEmpty
          //                       ? Color(0xff376AED)
          //                       : Colors.grey),
          //                   width: 3),
          //               borderRadius: BorderRadius.circular(18),
          //               //image: DecorationImage(image: AssetImage("images/sem1.png")),
          //             ),
          //           ),
          //           SizedBox(
          //             height: 5,
          //           ),
          //           Text(
          //             "Semester ${widget.sem}",
          //             style: TextStyle(fontSize: 10),
          //           )
          //         ],
          //       );
          //     } else {
          //       return StepProgressIndicator(
          //         totalSteps: 15,
          //         currentStep: 12,
          //         size: 20,
          //         selectedColor: Colors.amber,
          //         unselectedColor: Colors.black,
          //         roundedEdges: Radius.circular(10),
          //         gradientColor: LinearGradient(
          //           begin: Alignment.topLeft,
          //           end: Alignment.bottomRight,
          //           colors: [Colors.blue, Colors.grey],
          //         ),
          //       );
          //     }
          //   },
          // ),
        ),
      ],
    );
  }
}

class myStories extends StatelessWidget {
  myStories(
      {required this.sem, required this.stories, required this.storyData});

  String sem;
  int stories;
  List<storyObject> storyData = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            if ((await stories) != 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => storyViewPage(
                          stories: storyData,
                        )),
              );
            }
          },
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: 5, left: 6),
                height: getheight(context, 65),
                width: getheight(context, 65),
                padding: EdgeInsets.all(5),
                child: Image(image: NetworkImage(currentUser.profile_image)),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: (stories != 0 ? Color(0xff376AED) : Colors.grey),
                      width: 3),
                  borderRadius: BorderRadius.circular(18),
                  //image: DecorationImage(image: AssetImage("images/sem1.png")),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Your Story",
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
          // child: FutureBuilder<List<StoryItem>>(
          //   future: _stories,
          //   builder: (BuildContext context,
          //       AsyncSnapshot<List<StoryItem>> snapshot) {
          //     if (!snapshot.hasData) {
          //       return Column(
          //         children: [
          //           Container(
          //             margin: EdgeInsets.only(right: 5, left: 6),
          //             height: getheight(context, 65),
          //             width: getheight(context, 65),
          //             padding: EdgeInsets.all(5),
          //             child: Image(
          //                 image: AssetImage("images/sem${widget.sem}.png")),
          //             decoration: BoxDecoration(
          //               border: Border.all(
          //                   color: (snapshot.data!.isNotEmpty
          //                       ? Color(0xff376AED)
          //                       : Colors.grey),
          //                   width: 3),
          //               borderRadius: BorderRadius.circular(18),
          //               //image: DecorationImage(image: AssetImage("images/sem1.png")),
          //             ),
          //           ),
          //           SizedBox(
          //             height: 5,
          //           ),
          //           Text(
          //             "Semester ${widget.sem}",
          //             style: TextStyle(fontSize: 10),
          //           )
          //         ],
          //       );
          //     } else {
          //       return StepProgressIndicator(
          //         totalSteps: 15,
          //         currentStep: 12,
          //         size: 20,
          //         selectedColor: Colors.amber,
          //         unselectedColor: Colors.black,
          //         roundedEdges: Radius.circular(10),
          //         gradientColor: LinearGradient(
          //           begin: Alignment.topLeft,
          //           end: Alignment.bottomRight,
          //           colors: [Colors.blue, Colors.grey],
          //         ),
          //       );
          //     }
          //   },
          // ),
        ),
      ],
    );
  }
}
