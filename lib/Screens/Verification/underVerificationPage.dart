import 'package:flutter/material.dart';
import 'package:notio/main.dart';
import '../../utility.dart';

class creatorUnderVerification extends StatelessWidget {
  const creatorUnderVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.blue, // Status bar color
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: getheight(context, 25)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: getwidth(context, 20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                    Text("Verification",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700)),
                    // SizedBox(height: getheight(context, 10)),
                  ],
                ),
                
              ],
            ),
          ),
          SizedBox(
            height: getheight(context, 40),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              "“${currentUser.name}” we recieved your creator request!!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: getheight(context, 35),
          ),
          Image(
            image: AssetImage("images/verificationart.png"),
            height: getheight(context, 324),
            width: getwidth(context, 240),
          ),
          SizedBox(
            height: getheight(context, 40),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              "Your profile is under review by our team. 👨‍💻\nOnce verified you can start contributing.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
