import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notio/Screens/Creator/newPost.dart';
import 'package:notio/Screens/Home.dart';
import 'package:notio/Screens/Saved.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:notio/Screens/Search.dart';
import 'package:notio/Screens/Search1.dart';

import 'package:notio/utility.dart';

import 'Screens/Menu/Menu.dart';
import 'Screens/Story/uploadStory.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [Home(), Saved(), Search(), Menu()];

    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xffF5F5F8),
      body: DoubleBack(
          message: 'Tap back again to leave', child: screens[_index]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Navigator.pushNamed(context, '/newContribution');
          showModalBottomSheet<void>(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(400),
                        topRight: Radius.circular(400))),
                height: getheight(context, 180),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_circle_rounded,
                            size: 25,
                            color: blueColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              UploadStory(context);
                            },
                            child: Text(
                              "Add Story",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: getheight(context, 25),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => newPost()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_box,
                              size: 25,
                              color: blueColor,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Add Notes",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getheight(context, 20),
                      ),
                      GestureDetector(
                          onTap: () {
                            navigator!.pop();
                          },
                          child: Icon(Icons.cancel_outlined))
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (val) {
            setState(() {
              print(val);
              _index = val;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: getheight(context, 30)),
                label: ""),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(right: getwidth(context, 35)),
                  child: Icon(Icons.bookmark, size: getheight(context, 30)),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(left: getwidth(context, 35)),
                  child: Icon(Icons.search, size: getheight(context, 30)),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded, size: getheight(context, 30)),
                label: ""),
          ],
          selectedItemColor: blueColor,
          // iconSize: getheight(context, 60),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey,
          currentIndex: _index,
        ),
      ),
    );
  }
}
