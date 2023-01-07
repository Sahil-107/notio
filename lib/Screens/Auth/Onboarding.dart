import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notio/utility.dart';

class Onboarding extends StatefulWidget {
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  String branch = "Select Branch";
  String sem = "Select Semester";

  List<String> branchlist = ["Select Branch", "ECE", "IT", "CSE"];
  List<String> semlist = ["Select Semester", "1", "2", "3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: getheight(context, 65)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: getwidth(context, 23)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, Rahul!",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: getheight(context, 10),
                ),
                Text(
                  "Tell us a few things",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: getheight(context, 30),
                ),
                SizedBox(
                  height: getheight(context, 10),
                ),
                DropdownButtonFormField<String>(
                  menuMaxHeight: 260,
                  value: branch,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none),
                      // filled: true,
                      fillColor: Colors.white),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  elevation: 16,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  onChanged: (newValue) {
                    setState(() {
                      branch = newValue!;
                    });
                  },
                  items: branchlist.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Divider(
                  thickness: 2,
                  // color: blueColor,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: getheight(context, 13),
                ),
                SizedBox(
                  height: getheight(context, 10),
                ),
                DropdownButtonFormField<String>(
                  menuMaxHeight: 260,
                  value: sem,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none),
                      // filled: true,
                      fillColor: Colors.white),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  elevation: 16,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  onChanged: (newValue) {
                    setState(() {
                      sem = newValue!;
                    });
                  },
                  items: semlist.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Divider(
                  thickness: 2,
                  // color: blueColor,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: getheight(context, 45),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/navbar');
                  },
                  child: Container(
                    height: getheight(context, 60),
                    width: getwidth(context, 215),
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
                        "SAVE",
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
          ),
        ],
      ),
    );
  }
}





// Drop shadow in text field

// Material(
// 	elevation: 18,
// 	shadowColor: Colors.purple,
//     child: TextField(
// 	decoration: InputDecoration(
// 		fillColor: Colors.white,
// 		filled: true,
//    ), 
//   ),
//  ),