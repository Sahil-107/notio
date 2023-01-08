import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utility.dart';

class OTP extends StatelessWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: getheight(context, 60)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: getwidth(context, 40)),
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
                    Text(
                      "Enter OTP",
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
          Text("OTP send to {number}"),
        ],
      ),
    );
  }
}
