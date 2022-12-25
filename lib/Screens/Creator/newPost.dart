import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:notio/widgets.dart';

class newPost extends StatefulWidget {
  const newPost({Key? key}) : super(key: key);

  @override
  State<newPost> createState() => _newPostState();
}

class _newPostState extends State<newPost> {
  List<Widget> _tags = [];

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
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ));
              },
              child: Text("Add Tags"),
            ),
            Wrap(children: _tags)
          ],
        ),
      ),
    );
  }
}
