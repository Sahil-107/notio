import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../utility.dart';

class ResetPassword1 extends StatefulWidget {
  const ResetPassword1({Key? key}) : super(key: key);

  @override
  State<ResetPassword1> createState() => _ResetPassword1State();
}

class _ResetPassword1State extends State<ResetPassword1> {
  bool _isObscure = true;
  String _pass = "";
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
            image: AssetImage("images/Password.png"),
            height: getheight(context, 259),
            width: getwidth(context, 173),
          ),
          SizedBox(height: getheight(context, 60)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                TextField(
                    cursorColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        _pass = value;
                      });
                    },
                    obscureText: _isObscure,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.key_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            )),
                        // border: InputBorder.none,
                        hintText: "Enter Password",
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.withOpacity(0.5)))),
                SizedBox(
                  height: getheight(context, 10),
                ),
                TextField(
                    cursorColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        _pass = value;
                      });
                    },
                    obscureText: _isObscure,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.key_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            )),
                        // border: InputBorder.none,
                        hintText: "Re-enter Password",
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.withOpacity(0.5)))),
                SizedBox(
                  height: getheight(context, 40),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/resetPassword2');
                  },
                  child: Container(
                    height: getheight(context, 44),
                    width: getwidth(context, 247),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: 3,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12),
                        color: blueColor),
                    child: const Center(
                      child: Text(
                        "CONFIRM",
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
          )
        ],
      ),
    );
  }
}
