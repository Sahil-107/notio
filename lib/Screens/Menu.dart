// import 'dart:js';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getheight(context, 60)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: getwidth(context, 40)),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Menu",
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
              height: getheight(context, 30),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: getwidth(context, 24)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: Column(
                  children: [
                    SizedBox(
                      height: getheight(context, 26),
                    ),
                    Row(
                      children: [
                        Image(
                          image: AssetImage("images/person.png"),
                          height: getheight(context, 117),
                          width: getwidth(context, 87),
                        ),
                        SizedBox(
                          height: getheight(context, 15),
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
                            Text("University Institute of Technology"),
                            SizedBox(height: getheight(context, 30))
                          ],
                        )
                      ],
                    )
                  ],
                )),
            SizedBox(
              height: getheight(context, 37),
            ),
            info_containers(context, "Purchases", () {}),
            SizedBox(
              height: getheight(context, 22),
            ),
            info_containers(context, "Creator Verification", () {}),
            SizedBox(
              height: getheight(context, 22),
            ),
            info_containers(context, "FAQ", () {}),
            SizedBox(
              height: getheight(context, 22),
            ),
            info_containers(context, "Terms and conditions", () {}),
            SizedBox(
              height: getheight(context, 22),
            ),
            info_containers(context, "Logout", () {}),
            SizedBox(
              height: getheight(context, 90),
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
          margin: EdgeInsets.only(bottom: getwidth(context, 21)),
          height: getheight(context, 54),
          width: getwidth(context, 315),
          decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(20)),
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
