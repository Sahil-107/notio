import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:notio/main.dart';
import 'package:notio/utility.dart';

class newPost extends StatefulWidget {
  const newPost({Key? key}) : super(key: key);

  @override
  State<newPost> createState() => _newPostState();
}

class _newPostState extends State<newPost> {
  List<Widget> _tags = [];
  String _tag = "";
  String _subject = "Select Subject";

  List<String> _subjects = ["Select Subject", "VLSI", "DSA"];

  int _sem = 4;

  bool _visible = false;

  List<int> _sems = new List<int>.generate(currentUser.sem, (i) => i + 1);

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      print('Picked file: ${file.name}');
    } else {}
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(getwidth(context, 10),
                getheight(context, 20), getwidth(context, 10), 0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.keyboard_arrow_left,
                      size: getheight(context, 22)),
                ),
                SizedBox(
                  width: getwidth(context, 20),
                ),
                Text(
                  "New Contribution",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
          SizedBox(
            height: getheight(context, 30),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
                getwidth(context, 20), 0, getwidth(context, 20), 0),
            child: TextField(
              decoration: InputDecoration(
                  icon: Icon(Icons.copy),
                  hintText: "Title for you Notes.",
                  hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w800)),
            ),
          ),
          SizedBox(
            height: getheight(context, 16),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
                getwidth(context, 20), 0, getwidth(context, 20), 0),
            child: TextField(
              decoration: InputDecoration(
                  icon: Icon(Icons.description),
                  hintText: "One line discription.",
                  hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
            ),
          ),
          SizedBox(
            height: getheight(context, 16),
          ),

          //area 51

          Container(
            margin: EdgeInsets.fromLTRB(
                getwidth(context, 20), 0, getwidth(context, 20), 0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 1.0),
              ),
            ),
            child: DropdownButtonFormField<int>(
              menuMaxHeight: 260,
              value: _sems[0],
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.leaderboard),
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
                _sem = newValue!;
                setState(() {
                  _visible = true;
                });
              },
              items: _sems.map<DropdownMenuItem<int>>((value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
          ),

          Visibility(
            visible: _visible,
            child: Container(
              margin: EdgeInsets.fromLTRB(
                  getwidth(context, 20), 0, getwidth(context, 20), 0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 1.0),
                ),
              ),
              child: DropdownButtonFormField<String>(
                menuMaxHeight: 260,
                value: _subject,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.subject),
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
                  _subject = newValue!;
                },
                items: _subjects.map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),

          //area 51

          SizedBox(
            height: getheight(context, 35),
          ),

          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => Dialog(
                  child: Container(
                    height: getheight(context, 100),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: getwidth(context, 200),
                          child: TextField(
                            onChanged: (value) {
                              _tag = value;
                            },
                            decoration: InputDecoration(
                                hintText: "Enter Tag",
                                hintStyle: TextStyle(
                                    color: blueColor,
                                    fontWeight: FontWeight.w800)),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (_tag != "") {
                                _tags.add(
                                  _tagChip(
                                      header: _tag,
                                      reload: (String chip) {
                                        print(_tags);
                                        for (var element in _tags) {
                                          print(element);
                                        }
                                        setState(() {
                                          _tag = "";
                                        });
                                      }),
                                );
                              }
                            });
                          },
                          child: Icon(
                            Icons.add,
                            color: blueColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            child: Center(
              child: Text(
                "Add Tags",
                style: TextStyle(
                    color: blueColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 14),
              ),
            ),
          ),
          SizedBox(
            height: getheight(context, 14),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
                getwidth(context, 20), 0, getwidth(context, 20), 0),
            child: Wrap(
              children: _tags,
              spacing: 6,
              runAlignment: WrapAlignment.start,
            ),
          ),
          SizedBox(
            height: getheight(context, 115),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                pickFile();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                width: getwidth(context, 190),
                decoration: BoxDecoration(
                  color: Color(0xFF0D253C),
                  borderRadius: BorderRadius.circular(60),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 6,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.link,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: getwidth(context, 8),
                    ),
                    Text(
                      "Upload File",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
          //
          Spacer(),
          GestureDetector(
            onTap: () {
              ////////// SUBMIT
            },
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 14),
                width: getwidth(context, 212),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60), color: blueColor),
                child: const Center(
                  child: Text(
                    "PUBLISH",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: getheight(context, 35),
          )
        ],
      ),
    );
  }
}

class _tagChip extends StatelessWidget {
  _tagChip({required this.header, required this.reload});
  String header;
  Function reload;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        reload();
      },
      child: Chip(
        label: Text(
          header,
          style: TextStyle(
              color: blueColor, fontWeight: FontWeight.w600, fontSize: 14),
        ),
        side: BorderSide(color: blueColor),
        avatar: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.cancel,
            color: blueColor,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
