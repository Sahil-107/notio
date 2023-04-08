import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../utility.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool status = false;
  final _controller = ValueNotifier<bool>(false);
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
                    Text("Notification",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700)),
                    // SizedBox(height: getheight(context, 10)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: getheight(context, 15),
          ),
          Center(
            child: Container(
              child:
                  // FlutterSwitch(
                  //   width: getwidth(context, 319),
                  //   height: getheight(context, 44),
                  //   valueFontSize: 16,
                  //   toggleSize: 60,
                  //   inactiveColor: Colors.grey.withOpacity(0.2),
                  //   inactiveTextColor: Colors.grey,
                  //   activeColor: Colors.grey.withOpacity(0.2),
                  //   activeTextColor: Colors.blue,
                  //   activeText: 'Public',
                  //   value: status,
                  //   borderRadius: 30.0,
                  //   padding: 1,
                  //   showOnOff: true,
                  //   activeIcon: Text("Public"),
                  //   onToggle: (val) {
                  //     setState(() {
                  //       status = val;
                  //     });
                  //   },
                  // ),
                  AdvancedSwitch(
                controller: _controller,
                width: getwidth(context, 319),
                height: getheight(context, 44),
                activeColor: Colors.green,
                inactiveColor: Colors.grey,
                activeChild: Text('ON'),
                inactiveChild: Text('OFF'),
                borderRadius: BorderRadius.all(const Radius.circular(15)),
                enabled: true,
                disabledOpacity: 0.5,
                thumb: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(const Radius.circular(15)),
                  ),
                  height: getheight(context, 42),
                  width: getwidth(context, 150),
                ),
              ),
            ),
          ),
          SizedBox(
            height: getheight(context, 22),
          ),
          // padding: EdgeInsets.symmetric(horizontal: getwidth(context, 22)),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Notification(),
                  Notification(),
                  Notification(),
                  Notification(),
                  Notification(),
                  Notification(),
                  Notification(),
                  Notification(),
                  Notification(),
                  Notification(),
                  Notification(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Notification extends StatelessWidget {
  const Notification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getwidth(context, 22)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 5, left: 6),
                height: getheight(context, 65),
                width: getheight(context, 65),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/articles.png"),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  //image: DecorationImage(image: AssetImage("images/sem1.png")),
                ),
              ),
              SizedBox(
                width: getwidth(context, 8),
              ),
              Container(
                width: getwidth(context, 257),
                child: Text(
                  "Your password is now changed Log In to continue",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
          ),
          SizedBox(
            height: getheight(context, 15),
          )
        ],
      ),
    );
  }
}
