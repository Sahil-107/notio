import 'dart:convert';
import 'dart:io';

import 'package:double_back_to_close/toast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:notio/Screens/Creator/subjectObject.dart';
import 'package:notio/Screens/Subject.dart';
import 'package:notio/apiServices/notesService.dart';
import 'package:notio/main.dart';
import 'package:notio/utility.dart';

class newPost extends StatefulWidget {
  const newPost({Key? key}) : super(key: key);

  @override
  State<newPost> createState() => _newPostState();
}

//global bcs used by whole screen but still private for this file only
List<_tagChip> _tags = [];

class _newPostState extends State<newPost> {
  String _tag = "";
  subjectObject _subject = subjectObject("Select Subject", -1);
  List<subjectObject> _subjects = [subjectObject("Select Subject", -1)];
  int _sem = 0;
  notesServices _noterSevice = new notesServices();
  bool _visible = false;
  List<int> _sems = new List<int>.generate(currentUser.sem, (i) => i + 1);
  late PlatformFile _file;

  TextEditingController _discC = new TextEditingController();

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      _file = result.files.first;
      print('Picked file: ${_file.name}');
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    Map _noteData = {
      "uid": currentUser.id,
      "sem": _sem,
      "subject": _subject.subjectName,
      "course": currentUser.branch,
      "disc": _discC.text,
      "title": "",
      "tags": "",
    };

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
              onChanged: ((value) {
                _noteData["title"] = value;
              }),
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
              controller: _discC,
              decoration: InputDecoration(
                  icon: Icon(Icons.description),
                  hintText: "One line discription.",
                  hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
            ),
          ),

          //area 51

          Padding(
            padding: EdgeInsets.fromLTRB(
                getwidth(context, 20), 0, getwidth(context, 20), 0),
            child: Row(
              children: [
                Icon(
                  Icons.class_,
                  color: Colors.grey,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(getwidth(context, 16), 0, 0, 0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                    ),
                    child: DropdownButtonFormField<int>(
                      menuMaxHeight: 260,
                      value: _sems[0],
                      decoration: InputDecoration(
                          // prefixIcon: Icon(Icons.leaderboard),
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
                      onChanged: (newValue) async {
                        _sem = await newValue!;
                        _subjects = [subjectObject("Select Subject", -1)];
                        var data = await _noterSevice.getSubjects({
                          "course": currentUser.branch,
                          "sem": _sem,
                          "home_screen": "False"
                        });

                        for (var element in jsonDecode(data.body)["Subjects"]) {
                          _subjects.add(subjectObject(
                              element["subject_name"], element["subject_id"]));
                        }
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
                ),
              ],
            ),
          ),

          Visibility(
            visible: _visible,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  getwidth(context, 20), 0, getwidth(context, 20), 0),
              child: Row(
                children: [
                  Icon(
                    Icons.subject,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: Container(
                      margin:
                          EdgeInsets.fromLTRB(getwidth(context, 16), 0, 0, 0),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                      child: DropdownButtonFormField<subjectObject>(
                        menuMaxHeight: 260,
                        value: _subjects[0],
                        hint: Text("Select a subject"),
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
                        onChanged: (value) {
                          setState(() {
                            _subject = value!;
                          });
                        },
                        items: _subjects.map((subjectObject subject) {
                          return DropdownMenuItem<subjectObject>(
                            value: subject,
                            child: Text(subject.subjectName),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
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
                                _tags.add(_tagChip(
                                  header: _tag,
                                  index: _tags.length,
                                  screen_reload: () {
                                    setState(() {});
                                  },
                                ));
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
            onTap: () async {
              String _tagss = "";
              for (var element in _tags) {
                _tagss += "#";
                _tagss += element.header;
              }
              _noteData["tags"] = await _tagss;
              var res = await _noterSevice.uploadNote(File(_file.path!), _noteData);

              if (res.statusCode == 200) {
                var body = await res.stream.transform(utf8.decoder).join();
                Toast.show(jsonDecode(body)["Response"], context);
              } else {
                Toast.show(
                    'Request failed with status: ${res.statusCode}', context);
              }
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
  _tagChip(
      {required this.header, required this.index, required this.screen_reload});
  String header;
  int index;
  Function screen_reload;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _tags.removeAt(index);
        for (var i = index; i < _tags.length; i++) {
          _tags[i].index -= 1;
        }
        screen_reload();
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
