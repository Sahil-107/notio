import 'package:flutter/material.dart';
import 'package:notio/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utility.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.blue, // Status bar color
      ),
      backgroundColor: Colors.white.withOpacity(0.4),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getheight(context, 20)),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: getwidth(context, 20)),
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
                    Icon(Icons.notifications)
                  ],
                ),
              ),
              SizedBox(
                height: getheight(context, 20),
              ),
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
                          GestureDetector(
                            onTap: () async {
                            
                              prefs.clear();

                            },
                            child: Image(
                              image: NetworkImage(currentUser.profile_image),
                              height: getheight(context, 117),
                              width: getwidth(context, 87),
                            ),
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
              info_containers(context, "Creator's Space", () {
                Navigator.pushNamed(context, '/verificationDetails');
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

              // info_containers(context, "Logout", () {}),
              // SizedBox(
              //   height: getheight(context, 60),
              // ),
            ],
          ),
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
