import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notio/Objects/curUser.dart';
import 'package:notio/apiServices/authServices.dart';
import 'package:notio/main.dart';
import 'package:notio/utility.dart';

class Onboarding extends StatefulWidget {
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  String branch = "Select Branch";
  String sem = "Select Semester";
  String gender = "Select Gender";

  List<String> branchlist = ["Select Branch", "ECE", "IT", "CSE"];
  List<String> semlist = ["Select Semester", "1", "2", "3"];
  List<String> genders = ["Select Gender", "Male", "Female", "Chkke!"];

  List<String> _universities = ["Select University", "HPU", "HPTU", "CU"];
  List<String> _colleges = ["Select College", "UIT", "CU", "HPTU"];
  String _universityDropdownValue = "Select University";
  String _collegeDropdownValue = "Select College";

  authServices authservices = new authServices();

  Future<void> onboard() async {
    var user = {
      "id": currentUser.id,
      "name": currentUser.name,
      "branch": branch,
      "university": _universityDropdownValue,
      "college": _collegeDropdownValue,
      "gender": gender,
      "sem": int.parse(sem),
      "isVerified": currentUser.isverified,
      "isCreator": currentUser.iscreator,
    };
    var res = await authservices.onBoardUser(user);
    currentUser.setprofile_image(jsonDecode(res.body)["link"]);
    await setCurUser();
  }

  setCurUser() async {
    currentUser.setbranch(branch);
    currentUser.setuniversity(_universityDropdownValue);
    currentUser.setcollege(_collegeDropdownValue);
    currentUser.setgender(gender);
    currentUser.setsem(int.parse(sem));
    prefs.setInt("UID", currentUser.id);
  }

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
            padding: EdgeInsets.symmetric(horizontal: getwidth(context, 23)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, ${currentUser.name}!",
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
                  height: getheight(context, 40),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                  child: DropdownButtonFormField<String>(
                    menuMaxHeight: 260,
                    value: _universityDropdownValue,
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
                        color: Colors.black, fontWeight: FontWeight.normal),
                    onChanged: (newValue) {
                      setState(() {
                        _universityDropdownValue = newValue!;
                      });
                    },
                    items: _universities.map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: getheight(context, 23),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                  child: DropdownButtonFormField<String>(
                    menuMaxHeight: 260,
                    value: _collegeDropdownValue,
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
                        color: Colors.black, fontWeight: FontWeight.normal),
                    onChanged: (newValue) {
                      setState(() {
                        _collegeDropdownValue = newValue!;
                      });
                    },
                    items: _colleges.map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: getheight(context, 23),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                  child: DropdownButtonFormField<String>(
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
                        color: Colors.black, fontWeight: FontWeight.normal),
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
                ),
                SizedBox(
                  height: getheight(context, 23),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                  child: DropdownButtonFormField<String>(
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
                        color: Colors.black, fontWeight: FontWeight.normal),
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
                ),
                SizedBox(
                  height: getheight(context, 23),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                  child: DropdownButtonFormField<String>(
                    menuMaxHeight: 260,
                    value: gender,
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
                        color: Colors.black, fontWeight: FontWeight.normal),
                    onChanged: (newValue) {
                      setState(() {
                        gender = newValue!;
                      });
                    },
                    items: genders.map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: getheight(context, 45),
                ),
                InkWell(
                  onTap: () async {
                    await onboard();
                    Navigator.pushNamed(context, '/navbar');
                  },
                  child: Container(
                    height: getheight(context, 60),
                    width: getwidth(context, 215),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: 1,
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