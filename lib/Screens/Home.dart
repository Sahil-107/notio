import 'package:flutter/material.dart';
import 'package:notio/Screens/Story/mainPage.dart';
import 'package:notio/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.4),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: getheight(context, 60)),
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
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
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
            //margin: EdgeInsets.only(left: getwidth(context, 20)),
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
            height: getheight(context, 32),
          ),
          CarouselSlider(
            options: CarouselOptions(
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                viewportFraction: 0.7,
                height: getheight(context, 270)),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    height: getheight(context, 240),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 10,
                            blurRadius: 5,
                            offset: Offset(1, 0), // changes position of shadow
                          ),
                        ],
                        image: DecorationImage(
                            image: AssetImage('images/chip.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(28)),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: getheight(context, 40),
          ),
          Center(
            child: Text(
              "Might be useful",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: getheight(context, 27),
          ),
          Container(
            height: getheight(context, 141),
            margin: EdgeInsets.only(
                left: getwidth(context, 40), right: getwidth(context, 40)),
            child: Row(
              children: [
                Container(
                  width: getwidth(context, 92),
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
              borderRadius: BorderRadius.circular(24),
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
