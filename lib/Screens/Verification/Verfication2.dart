import 'package:flutter/material.dart';
import '../../widgets.dart';

class Verification2 extends StatelessWidget {
  const Verification2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: getheight(context, 60)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: getwidth(context, 40)),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Verification",
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              "“Name” we recieved your creator request!!",
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
