import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utility.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.blue, // Status bar color
      ),
      backgroundColor: Colors.white.withOpacity(0.96),
      body: Column(
        children: [
          SizedBox(height: getheight(context, 25)),
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
                    Text("Wallet",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700)),
                    // SizedBox(height: getheight(context, 10)),
                  ],
                ),
                // Spacer(),
                // Icon(Icons.notifications)
              ],
            ),
          ),
          SizedBox(
            height: getheight(context, 30),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: getwidth(context, 25)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Your overall balance"),
                SizedBox(
                  height: getheight(context, 18),
                ),
                Text(
                  "Rs. 5200/-",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: getheight(context, 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: getheight(context, 69),
                      width: getwidth(context, 93),
                      decoration: BoxDecoration(
                          color: Color(0xFF0D253C),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    Container(
                      height: getheight(context, 69),
                      width: getwidth(context, 93),
                      decoration: BoxDecoration(
                          color: Color(0xFF0D253C),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    Container(
                      height: getheight(context, 69),
                      width: getwidth(context, 93),
                      decoration: BoxDecoration(
                          color: Color(0xFF0D253C),
                          borderRadius: BorderRadius.circular(12)),
                    )
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
