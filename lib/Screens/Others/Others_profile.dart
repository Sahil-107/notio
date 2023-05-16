import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../main.dart';
import '../../utility.dart';

class Others_profile extends StatelessWidget {
  const Others_profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.blue, // Status bar color
        ),
        body: Column(
          children: [
            SizedBox(height: getheight(context, 20)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: getwidth(context, 20)),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      size: getheight(context, 22),
                    ),
                  ),
                  SizedBox(
                    width: getwidth(context, 20),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Profile",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w700)),
                      // SizedBox(height: getheight(context, 10)),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.notifications)
                ],
              ),
            ),
            SizedBox(
              height: getheight(context, 40),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: getwidth(context, 30)),
                  padding: EdgeInsets.all(getwidth(context, 20)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.5,
                        blurRadius: 4,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: getheight(context, 84),
                            width: getheight(context, 80),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(28),
                                border: Border.all(color: Colors.lightBlue)),
                          ),
                          SizedBox(width: getwidth(context, 24)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("@${currentUser.username}"),
                              SizedBox(
                                height: getheight(context, 2),
                              ),
                              Text(
                                currentUser.name,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: getheight(context, 2),
                              ),
                              Container(
                                  width: getwidth(context, 170),
                                  child: Text(
                                      "University Institute of Technology"))
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: getheight(context, 20),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About me",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: getheight(context, 8),
                          ),
                          Text(
                              "Madison Blackstone is a director of user experience design, with experience managing global teams."),
                          SizedBox(
                            height: getheight(context, 30),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text("250",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Text("   Following   ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                              Column(
                                children: [
                                  Text("4.5K",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Text("     Likes     ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: getheight(context, 30),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: getheight(context, 300),
                  right: 0.0,
                  left: 0.0,
                  child: GestureDetector(
                    onTap: () {
                      //////////// Follow unfollow ////////////////////
                    },
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 120),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.lightBlue,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 12,
                              offset:
                                  Offset(0, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Follow",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          ),
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getheight(context, 50),
            ),
            Text(
              "Spot Light",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            )
          ],
        ));
  }
}
