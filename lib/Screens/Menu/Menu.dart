import 'package:flutter/material.dart';
import 'package:notio/Screens/Creator/CreatorMenu.dart';
import 'package:notio/Screens/Creator/CreatorProfile.dart';
import 'package:notio/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utility.dart';

class Menu extends StatelessWidget {
  Menu({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.blue, // Status bar color
      ),
      backgroundColor: Color(0xffF5F5F8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getheight(context, 20)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: getwidth(context, 20)),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Menu",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: () {
                        prefs.clear();
                        Navigator.pushReplacementNamed(context, "/login");
                      },
                      child: Icon(
                        Icons.logout,
                        color: Colors.blue,
                      ))
                ],
              ),
            ),
            SizedBox(height: 20,),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: getwidth(context, 24)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Column(
                      children: [
                        SizedBox(
                          height: getheight(context, 26),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: getwidth(context, 10),
                            ),
                            Image(
                              image: NetworkImage(currentUser.profile_image),
                              height: getheight(context, 117),
                              width: getwidth(context, 87),
                            ),
                            SizedBox(
                              width: getwidth(context, 10),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(currentUser.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    )),
                                SizedBox(
                                  height: getheight(context, 10),
                                ),
                                Text(currentUser.email),
                                SizedBox(
                                  height: getheight(context, 10),
                                ),
                                Text("+91 ${currentUser.phone}"),
                                SizedBox(
                                  height: getheight(context, 10),
                                ),
                                Container(
                                  width: getwidth(context, 160),
                                  child: Text(currentUser.college +
                                      ", " +
                                      currentUser.university),
                                ),
                                SizedBox(
                                  height: getheight(context, 30),
                                )
                              ],
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                EditDialogBox(context);
                              },
                              child: Text(
                                "Edit",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 14),
                              ),
                            ),
                            SizedBox(
                              width: getwidth(context, 20),
                            )
                          ],
                        ),
                        SizedBox(
                          height: getheight(context, 40),
                        )
                      ],
                    )),
                Positioned(
                  top: getheight(context, 160),
                  right: 0.0,
                  left: 0.0,
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: getwidth(context, 70)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.lightBlue,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 12,
                          offset: Offset(0, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xff2151CD)),
                            child: Column(
                              children: [
                                Text(
                                    (currentUser.followers.split("#").length -
                                            1)
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text("   Followers   ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            child: Column(
                              children: [
                                Text(
                                    (currentUser.following.split("#").length -
                                            1)
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text("   Following   ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: getheight(context, 20),
                ),
              ],
            ),
            SizedBox(
              height: getheight(context, 70),
            ),
            info_containers(context, "Purchases", () {}),
            SizedBox(
              height: getheight(context, 18),
            ),
            info_containers(context, "Creator's Space", () {
              if (currentUser.iscreator) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreatorProfile()));
              } else {
                Navigator.pushNamed(context, '/verificationDetails');
              }
            }),
            Visibility(
              visible: currentUser.iscreator,
              child: Column(
                children: [
                  SizedBox(
                    height: getheight(context, 18),
                  ),
                  info_containers(context, "Revenue", () {
                    Navigator.pushNamed(context, '/revenue');
                  }),
                ],
              ),
            ),
            SizedBox(
              height: getheight(context, 18),
            ),
            info_containers(context, "FAQ", () {}),
            SizedBox(
              height: getheight(context, 18),
            ),
            info_containers(context, "Terms and conditions", () {
              Navigator.pushNamed(context, '/otp');
            }),
            SizedBox(
              height: getheight(context, 18),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> EditDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Edit Details",
                        style: TextStyle(
                            fontSize: getheight(context, 16),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: getheight(context, 10),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                            initialValue: "Sahil Negi",
                            validator: (value) {
                              if (value.toString().length < 4 ||
                                  value.toString().length > 18) {
                                return "Enter valid Name!";
                              }
                              return null;
                            },
                            onChanged: ((value) {
                              // name = value;
                            }),
                            style: TextStyle(
                                fontSize: getheight(context, 17),
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Icon(
                                    Icons.person_outlined,
                                    color: Colors.grey,
                                  ),
                                ),
                                hintText: "Name",
                                hintStyle: TextStyle(
                                    fontSize: 17,
                                    color: Colors.grey.withOpacity(0.5)))),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "🇮🇳",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              " +91",
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: getwidth(context, 178),
                              child: TextFormField(
                                  initialValue: "9459301442",
                                  textAlign: TextAlign.center,
                                  validator: (value) {
                                    if (value.toString().length != 10) {
                                      return "Enter valid Number!";
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    // _phone = value;
                                  },
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                      hintText: "Phone number",
                                      hintStyle: TextStyle(
                                          fontSize: 16,
                                          color:
                                              Colors.grey.withOpacity(0.5)))),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getheight(context, 10),
                      ),
                      SizedBox(height: getheight(context, 20)),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            // showSpinner = true;
                            // print("spinner true");
                          });
                        },
                        child: Container(
                          height: getheight(context, 50),
                          width: getwidth(context, 100),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: blueColor),
                          child: Center(
                            child: Text(
                              "Done",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getheight(context, 17)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  Widget info_containers(
      BuildContext context, String function_name, Function functoin_work) {
    return GestureDetector(
      onTap: () {
        functoin_work();
      },
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: getheight(context, 22)),
          width: getwidth(context, 315),
          decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              SizedBox(
                width: getwidth(context, 22),
              ),
              Text(
                function_name,
                style: TextStyle(
                    fontSize: getheight(context, 18),
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w800),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: getheight(context, 18),
              ),
              SizedBox(
                width: getwidth(context, 22),
              )
            ],
          ),
        ),
      ),
    );
  }
}
