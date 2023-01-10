import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../utility.dart';

class ResetPassword2 extends StatefulWidget {
  const ResetPassword2({Key? key}) : super(key: key);

  @override
  State<ResetPassword2> createState() => _ResetPassword2State();
}

class _ResetPassword2State extends State<ResetPassword2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: getheight(context, 60)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: getwidth(context, 30)),
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
                  width: getwidth(context, 10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Reset Password",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    // SizedBox(height: getheight(context, 10)),
                  ],
                ),
                Spacer(),
                Icon(Icons.notifications)
              ],
            ),
          ),
          SizedBox(
            height: getheight(context, 15),
          ),
          SizedBox(height: getheight(context, 40)),
          Image(
            image: AssetImage("images/resetpassword.png"),
            height: getheight(context, 259),
            width: getwidth(context, 173),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getwidth(context, 37)),
            child: Text(
              "Your password is now changed Log In to continue",
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: getheight(context, 50),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/resetPassword1');
            },
            child: Container(
              height: getheight(context, 44),
              width: getwidth(context, 247),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 3,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ], borderRadius: BorderRadius.circular(12), color: blueColor),
              child: const Center(
                child: Text(
                  "LOG IN",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
