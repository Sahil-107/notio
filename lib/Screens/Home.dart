import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notio/Screens/NoteModule/noteModule.dart';
import 'package:notio/Screens/Story/mainPage.dart';
import 'package:notio/utility.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.blue, // Status bar color
      ),
      backgroundColor: bg,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getheight(context, 20)),
            Container(
              height: getheight(context, 80),
              padding: EdgeInsets.symmetric(horizontal: getwidth(context, 20)),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi, Rahul!"),
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
            // SizedBox(
            //   height: getheight(context, 25),
            // ),
            Container(
              height: getheight(context, 92),
              margin: EdgeInsets.only(
                  left: getwidth(context, 10), right: getwidth(context, 10)),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Semester(
                    sem: 1.toString(),
                  ),
                  Semester(
                    sem: 2.toString(),
                  ),
                  Semester(
                    sem: 3.toString(),
                  ),
                  Semester(
                    sem: 4.toString(),
                  ),
                  Semester(
                    sem: 5.toString(),
                  ),
                  Semester(
                    sem: 6.toString(),
                  ),
                  Semester(
                    sem: 7.toString(),
                  ),
                  Semester(
                    sem: 8.toString(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getheight(context, 22),
            ),
            CarouselSlider(
              options: CarouselOptions(
                  clipBehavior: Clip.none,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.7,
                  height: getheight(context, 260)),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi, Rahul!"),
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
            )
          ],
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
                color: Color(0xFF0D253C).withOpacity(0.44),
                spreadRadius: 0,
                blurRadius: 22,
                offset: Offset(0, 16), // changes position of shadow
              ),
            ],
            image: DecorationImage(
                image: AssetImage('images/chip.jpg'), fit: BoxFit.cover),
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
                    fontSize: 18,
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
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
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
          left: getwidth(context, 40),
          right: getwidth(context, 40),
          bottom: getheight(context, 15)),
      child: Row(
        children: [
          Container(
            width: getwidth(context, 92),
            height: getheight(context, 121),
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("images/articles.png"))),
          ),
          SizedBox(
            width: getwidth(context, 20),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "BIG DATA",
                style: TextStyle(
                    color: Color(0xff376AED),
                    fontSize: 14,
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
    );
  }
}

class Semester extends StatelessWidget {
  Semester({required this.sem});

  String sem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => storyView(),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(right: 5, left: 6),
            height: getheight(context, 65),
            width: getheight(context, 65),
            padding: EdgeInsets.all(5),
            child: Image(image: AssetImage("images/sem$sem.png")),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF376AED), width: 3),
              borderRadius: BorderRadius.circular(18),
              //image: DecorationImage(image: AssetImage("images/sem1.png")),
            ),
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
    );
  }
}
