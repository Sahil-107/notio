// import 'dart:js';
import 'package:flutter/material.dart';
import '../../utility.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.4),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getheight(context, 60)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: getwidth(context, 40)),
              child: Row(
                children: [
                  SizedBox(
                    width: getwidth(context, 20),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Menu",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      // SizedBox(height: getheight(context, 10)),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/notifications');
                      },
                      child: Icon(Icons.notifications))
                ],
              ),
            ),
            SizedBox(
              height: getheight(context, 30),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: getwidth(context, 24)),
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
                          image: AssetImage("images/person.png"),
                          height: getheight(context, 117),
                          width: getwidth(context, 87),
                        ),
                        SizedBox(
                          width: getwidth(context, 10),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Modi ji",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                )),
                            SizedBox(
                              height: getheight(context, 10),
                            ),
                            Text("modi@gmail.com"),
                            SizedBox(
                              height: getheight(context, 10),
                            ),
                            Text("+92 188274734"),
                            SizedBox(
                              height: getheight(context, 10),
                            ),
                            Container(
                              width: getwidth(context, 160),
                              child: Text("University Institute of Technology"),
                            ),
                            SizedBox(
                              height: getheight(context, 30),
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          "Edit",
                          style: TextStyle(color: Colors.blue, fontSize: 14),
                        ),
                        SizedBox(
                          width: getwidth(context, 20),
                        )
                      ],
                    )
                  ],
                )),
            SizedBox(
              height: getheight(context, 27),
            ),
            info_containers(context, "Purchases", () {}),
            SizedBox(
              height: getheight(context, 18),
            ),
            info_containers(context, "Creator Verification", () {
              Navigator.pushNamed(context, '/verificationDetails');
            }),
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
            // Image(
            //     image: AssetImage("images/logout.png"),
            //     height: getheight(context, 65),
            //     width: getheight(context, 65)),
            info_containers(context, "Logout", () {}),
            SizedBox(
              height: getheight(context, 110),
            )
          ],
        ),
      ),
    );
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
