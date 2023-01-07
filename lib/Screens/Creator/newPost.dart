import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:notio/utility.dart';

class newPost extends StatefulWidget {
  const newPost({Key? key}) : super(key: key);

  @override
  State<newPost> createState() => _newPostState();
}

class _newPostState extends State<newPost> {
  List<Widget> _tags = [];
  String _tag = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          left: getwidth(context, 30),
          top: getheight(context, 58),
          right: getwidth(context, 30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back_ios),
                SizedBox(
                  width: getwidth(context, 20),
                ),
                Text(
                  "New Contribution",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
            SizedBox(
              height: getheight(context, 44),
            ),
            TextField(
              decoration: InputDecoration(
                  icon: Icon(Icons.copy),
                  hintText: "Title for you Notes.",
                  hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w800)),
            ),
            SizedBox(
              height: getheight(context, 16),
            ),
            TextField(
              decoration: InputDecoration(
                  icon: Icon(Icons.description),
                  hintText: "One line discription.",
                  hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
            ),
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
                                          setState(() {});
                                        }),
                                  );
                                  _tag = "";
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
              child: Text(
                "Add Tags",
                style: TextStyle(
                    color: blueColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 14),
              ),
            ),
            SizedBox(
              height: getheight(context, 14),
            ),
            Wrap(
              children: _tags,
              spacing: 6,
              runAlignment: WrapAlignment.start,
            ),
            SizedBox(
              height: getheight(context, 115),
            ),
            Center(
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
            SizedBox(
              height: getheight(context, 20),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                width: getwidth(context, 190),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 6,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                    color: Color(0xFF0D253C),
                    borderRadius: BorderRadius.circular(60)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: getwidth(context, 8),
                    ),
                    Text(
                      "Upload Image",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
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
                      borderRadius: BorderRadius.circular(60),
                      color: blueColor),
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
        avatar: Icon(
          Icons.cancel,
          color: blueColor,
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
